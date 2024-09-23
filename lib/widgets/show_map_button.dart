import 'package:flutter/material.dart';
import './userLocationMap.dart';

class ShowMapButton extends StatelessWidget {
  final List<Map<String, String>> members; // Pass the members list

  ShowMapButton({required this.members});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to UserLocationMap with the members list
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserLocationMap(members: members),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          child: Text('Show Map View'),
        ),
      ),
    );
  }
}
