import 'package:flutter/material.dart';
import 'package:projectui/pdf.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
 final images=[
      'fibio.jpg',
   'oswal.png',
      'figchem.jpg',
   'pcb.jpg',
   'figmath.jpg',
   'tar.jpg',
   'figphy.jpg',
 ];
 final images1=[
   'eror.jpg',
   'm12.jpg',
   'thin.jpg',
   'btch.jpg',
   'figmath.jpg',
   'oswal.png',
 ];
 final images2=[
   'not.png',
   'chn.png',
   'mat.png',
   'bion.png',
 ];
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body:  SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return[ SliverAppBar(
              floating: true,
              snap: true,
              pinned: true,
              expandedHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.asset(
                      "assets/images/slib3.jpg",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    const Positioned(
                      bottom: 0,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Library',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              automaticallyImplyLeading: false,
            ),
          ];
    },
      body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.menu_book_outlined),
                    title: Text("NCERT Complement",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: List.generate(
                          7,
                              (index) => BookCard(imageAsset: 'assets/images/${images[index]}', width: screenWidth * 0.4),//$index
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  ListTile(
                    leading: Icon(Icons.library_books_outlined),
                    title: Text("Recommended Books",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: List.generate(
                          6,
                              (index) => BookCard(imageAsset: 'assets/images/${images1[index]}', width: screenWidth * 0.4),//${index + 6}
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  ListTile(
                    leading: Icon(Icons.handshake),
                    title: Text("Hand-Written Notes by Proffesor's",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> PDFScreen(doc: 'assets/pdf/phy.pdf')));
                        },
                        child: Row(
                          children: List.generate(
                            4,
                                (index) => BookCard(imageAsset: 'assets/images/${images2[index]}', width: screenWidth * 0.4),//${index + 12}
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 150),
                ],
              ),
            ),

    ),
        ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imageAsset;
  final double width;

  const BookCard({required this.imageAsset, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imageAsset,
          fit: BoxFit.cover,
          height: 160,
          width: width,
        ),
      ),
    );
  }
}

