import 'package:flutter/material.dart';
import 'package:flutter_coffee_page/util/coffee_tile.dart';
import 'package:flutter_coffee_page/util/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false
    ],
    [
      'Tea',
      false,
    ],
  ];

  void coffeeTypeSelected(int index){
    setState(() {

      // Makes the rest of choices except cappucino false

      for(int i = 0; i < coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.person),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: ''
            )
          ]
        ),
        body: Column(children: [
          // Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 60
              ),
            ),
          ),
    
          SizedBox(height: 25),
    
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                  
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          
          SizedBox(height: 25),
    
          // horizontal listview of coffee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index){
              return CoffeeType(
                coffeeType: coffeeType[index][0], 
                isSelected: coffeeType[index][1], 
                onTap: () {
                  coffeeTypeSelected(index);
                },
              );
            })),
    
          // horizontal listview for coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'https://images.unsplash.com/photo-1594261956806-3ad03785c9b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                  coffeeName: 'Cappucino',
                  coffeePrice: '4.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'https://images.unsplash.com/photo-1630620276854-c68ae3b47678?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                  coffeeName: 'Latte',
                  coffeePrice: '4.00',
                ),
                CoffeeTile(
                  coffeeImagePath: 'https://images.unsplash.com/photo-1630620276854-c68ae3b47678?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                  coffeeName: 'Black',
                  coffeePrice: '4.00',
                ),
              ],
            ),
          )
        ],)
      ),
    );
  }
}