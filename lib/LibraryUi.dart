import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectui/Textbook.dart';
import 'dart:convert';

import 'main.dart';

class Card3D {
  const Card3D({
    required this.title,
    required this.description,
    required this.pdfFile,
    required this.pdfImg,
  });

  final String title;
  final String description;
  final String pdfFile;
  final String pdfImg;
}

/*final cardList = [
  Card3D(author: 'Rahul', title: 'Physics', image: 'assets/images/chn.png'),
  Card3D(author: 'Amar', title: 'Chemistry', image: 'assets/images/img.png'),
  Card3D(author: 'Arpita', title: 'Chemistry', image: 'assets/images/mat.png'),
  Card3D(author: 'Raza', title: 'Biology', image: 'assets/images/not.png'),
  Card3D(author: 'Umar', title: 'Maths', image: 'assets/images/oswal.png'),
  Card3D(author: 'Rahul', title: 'Physics', image: 'assets/images/chn.png'),
  Card3D(author: 'Amar', title: 'Chemistry', image: 'assets/images/img.png'),
  Card3D(author: 'Arpita', title: 'Chemistry', image: 'assets/images/mat.png'),
  Card3D(author: 'Raza', title: 'Biology', image: 'assets/images/not.png'),
  Card3D(author: 'Umar', title: 'Maths', image: 'assets/images/oswal.png'),
];*/
Future<List<Card3D>> fetchCardData() async {
  final response = await http.get(Uri.parse('$globalapi/Library/'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) {
      return Card3D(
        title: json['title'],
        description: json['description'],
        pdfFile: json['pdf_file'],
        pdfImg: json['pdf_img'],
      );
    }).toList();
  } else {
    throw Exception('Failed to load card data');
  }
}
List<Card3D> cardList = [];

class CardsHome extends StatefulWidget {
  const CardsHome({Key? key}) : super(key: key);

  @override
  State<CardsHome> createState() => _CardsHomeState();
}

class _CardsHomeState extends State<CardsHome> {
  final ValueNotifier<Card3D?> _selectedCardNotifier = ValueNotifier<Card3D?>(null);
  Card3D? _selectedHorizontalCard;


  void handleCardSelected(Card3D selectedCard) {
    _selectedCardNotifier.value = selectedCard;
  }

  void handleHorizontalCardSelected(Card3D selectedCard) {
    setState(() {
      _selectedHorizontalCard = selectedCard;
    });
  }
  @override
  void initState() {
    super.initState();
    fetchCardData();
    fetchCardData().then((cards) {
      setState(() {
        cardList = cards;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'My Library',
          style: TextStyle(color: Colors.deepOrange),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CardBody(selectedCardNotifier: _selectedCardNotifier),
          ),
          Expanded(
            flex: 2,
            child: CardsHorizontal(
              selectedCardNotifier: _selectedCardNotifier,
              onCardSelected: handleHorizontalCardSelected,
            ),
          ),
          SizedBox(height: 100,),
        ],
      ),
    );
  }
}

class CardBody extends StatefulWidget {
  const CardBody({Key? key, required this.selectedCardNotifier}) : super(key: key);
  final ValueNotifier<Card3D?> selectedCardNotifier;

  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> with TickerProviderStateMixin {
  bool _selectedMode = false;
  late AnimationController _animationControllerSelection;
  late AnimationController _animationControllerMovement;
  int? _selectedIndex;

  Card3D? _selectedHorizontalCard;

  Future<void> _onCardSelected(Card3D card, int index) async {
    setState(() {
      _selectedIndex = index;
    });
    final duration = Duration(milliseconds: 750);
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        pageBuilder: (context, animation, _) => FadeTransition(
          opacity: animation,
          child: CardDetails(card: card),
        ),
      ),
    );
    _animationControllerMovement.reverse(from: 1.0);
  }

  int _getCurrentFactor(int currentIndex) {
    if (_selectedIndex == null || currentIndex == _selectedIndex) {
      return 0;
    } else if (currentIndex > _selectedIndex!) {
      return -1;
    } else {
      return 1;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.selectedCardNotifier.addListener(() {
      final selectedCard = widget.selectedCardNotifier.value;
      if (selectedCard != null) {
        setState(() {
          _selectedHorizontalCard = selectedCard;
        });
      }
    });

    _animationControllerSelection = AnimationController(
      vsync: this,
      lowerBound: 0.15,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 500),
    );
    _animationControllerMovement = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 880),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationControllerSelection.dispose();
    _animationControllerMovement.dispose();
    super.dispose();
  }

  double _value = 0.15;

  @override
  Widget build(BuildContext context) {
    final selectedCard = _selectedHorizontalCard ?? widget.selectedCardNotifier.value;

    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onTap: () {
          if (!_selectedMode) {
            _animationControllerSelection.forward().whenComplete(() {
              setState(() {
                _selectedMode = true;
              });
            });
          } else {
            _animationControllerSelection.reverse().whenComplete(() {
              setState(() {
                _selectedMode = false;
              });
            });
          }
        },
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(_value),
          child: AbsorbPointer(
            absorbing: !_selectedMode,
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth * 0.45,
              color: Colors.white,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ...List.generate(cardList.length, (index) => Card3DItem(
                    height: constraints.maxHeight / 2,
                    card: cardList[index],
                    percent: _value,
                    depth: index,
                    verticalFactor: _getCurrentFactor(index),
                    animation: _animationControllerMovement,
                    onCardSelected: (card) {
                      _onCardSelected(card, index);
                    },
                  )).reversed,
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Slider(
                      value: _value,
                      min: 0.15,
                      max: 0.5,
                      onChanged: (val) {
                        setState(() {
                          _value = val;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class Card3DItem extends AnimatedWidget {
  const Card3DItem({
    Key? key,
    required this.card,
    required this.percent,
    required this.height,
    required this.depth,
    required this.onCardSelected,
    this.verticalFactor = 0,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);
  final Card3D card;
  final double percent;
  final double height;
  final int depth;
  final ValueChanged<Card3D> onCardSelected;
  final int verticalFactor;
  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    final depthFactor = 50.0;
    final bottomMargin = height / 4.0;
    final heroTag = 'card_${card.title}';

    return Positioned(
      left: 0,
      right: 0,
      top: height + -depth * height / 2.0 * percent - bottomMargin,
      child: Opacity(
        opacity: verticalFactor == 0 ? 1 : 1 - animation.value,
        child: Hero(
          tag: heroTag,
          flightShuttleBuilder: (context, animation, flightDirection, fromHeroContext, toHeroContext) {
            Widget _current;
            if (flightDirection == HeroFlightDirection.push) {
              _current = toHeroContext.widget;
            } else {
              _current = fromHeroContext.widget;
            }
            return AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                final newvalue = lerpDouble(0.0, 2 * pi, animation.value);
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(newvalue!),
                  child: _current,
                );
              },
            );
          },
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, verticalFactor * animation.value * MediaQuery.of(context).size.height, depth * depthFactor),
            child: GestureDetector(
              onTap: () {
                onCardSelected(card);
              },
              child: SizedBox(
                height: height,
                child: Card3DWidget(
                  card: card,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardsHorizontal extends StatelessWidget {
  const CardsHorizontal({
    Key? key,
    required this.selectedCardNotifier,
    required this.onCardSelected,
  }) : super(key: key);
  final ValueNotifier<Card3D?> selectedCardNotifier;
  final Function(Card3D) onCardSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text('Turning Pages to Triumph'),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cardList.length,
            itemBuilder: (context, index) {
              final card = cardList[index];
              return GestureDetector(
                onTap: () {
                  selectedCardNotifier.value = card;
                  onCardSelected(card);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFViewerPage(pdfPath: card.pdfFile)));
                      },
                      child: Card3DWidget(card: card)
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Card3DWidget extends StatelessWidget {
  const Card3DWidget({Key? key, required this.card}) : super(key: key);
  final Card3D card;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(15.0);
    return PhysicalModel(
      color: Colors.white,
      elevation: 10,
      borderRadius: border,
      child: ClipRRect(
        borderRadius: border,
        child: Image.network(
          card.pdfImg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key, required this.card}) : super(key: key);
  final Card3D card;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black45,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: size.height * 0.1),
            Align(
              child: SizedBox(
                height: 150,
                child: Hero(
                  tag: card.title,
                  child: Card3DWidget(
                    card: card,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                card.title,
                style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                card.description,
                style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
