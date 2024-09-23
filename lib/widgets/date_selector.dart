import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Tue, Aug 31 2022', style: TextStyle(fontSize: 16)),
          IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today)),
        ],
      ),
    );
  }
}
