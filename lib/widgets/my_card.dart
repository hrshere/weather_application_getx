import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String value;
  const MyCard({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),

      ),
      color: Colors.yellowAccent.withOpacity(0.1),

      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            height: 50,
            width: 100,
            child: Text(title),
          ),
          SizedBox(height: 20,),
          Container(
            child: Text(value),
          )

        ],
      )
    );
  }
}
