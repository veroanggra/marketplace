import 'package:flutter/material.dart';
import 'package:marketplace/model/bicycle.dart';
import 'package:marketplace/screen/cart_screen.dart';
import 'package:marketplace/screen/detail_screen.dart';
import 'package:marketplace/screen/info_screen.dart';
import 'package:marketplace/util/widget.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Bike Shop',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CartScreen();
                }));
              }),
          IconButton(
              icon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfoScreen();
                }));
              })
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Material(
          color: Colors.transparent,
          child: Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: bikeList.map((bike) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(bicycle: bike);
                    }));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Image.network(bike.bikeImage, width: MediaQuery.of(context).size.width * 0.5 - 20, height: MediaQuery.of(context).size.height * 0.2 - 40),
                            decoration: BoxDecoration(color: bike.bikeColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4, left: 4),
                        child: Text(
                          bike.bikeName,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4, left: 4),
                        child: Text(
                          rupiahCurrencyFormat.format(bike.bikePrice),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
