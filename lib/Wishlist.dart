import 'package:flutter/material.dart';
import 'package:projectui/wish.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final List<WishlistItem> wishlistItems = [
    WishlistItem('Physics Video', 'Description of '),
    WishlistItem('Math Tutorial', 'Description '),
    // Add more wishlist items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
      ),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: WishListCard(
              wishlistItem: wishlistItems[index],
              widthFactor: 1.1,
              leftPosition: 100,
              isWishlist: true,
            ),
          );
        },
      ),
    );
  }
}
