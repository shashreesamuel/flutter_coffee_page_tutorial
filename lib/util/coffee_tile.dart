import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile({Key? key, required this.coffeeImagePath, required this.coffeeName, required this.coffeePrice}) : super(key: key);

  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(coffeeImagePath),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: TextStyle(
                      fontSize: 20
                    )
                  ),
                  SizedBox(height: 4),
                  Text(
                    'With Almond Milk',
                    style: TextStyle(
                      color: Colors.grey[700]
                    )
                  )
                ]
              ),
            ),

            // price 

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\s' + coffeePrice),
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}