import 'package:flutter/material.dart';
import 'package:projectui/Wishlist.dart';

class WishListCard extends StatelessWidget {
  final WishlistItem wishlistItem;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  WishListCard({
    Key? key,
    required this.wishlistItem,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;

    return Stack(
      children: <Widget>[
        Container(
          width: widthValue,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                'assets/images/chm.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), // Apply a subtle overlay
                BlendMode.darken,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // ... Existing code ...
        Positioned(
          top: 65,
          left: leftPosition + 5,
          child: Container(
            width: widthValue - 15 - leftPosition,
            height: 70,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: Colors.transparent, // Change to transparent
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          wishlistItem.title,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto', // Choose a font
                          ),
                        ),
                        Text(
                          wishlistItem.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'YourPreferredFont',
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isWishlist)
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    )
                  else
                    SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class WishlistItem {
  final String title;
  final String description;

  WishlistItem(this.title, this.description);
}