import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberCard extends StatelessWidget {
  final Map<String, String> member;

  MemberCard({required this.member});

  void _launchMaps(String address) async {
    String url = 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: ListTile(
        leading: CircleAvatar(child: Text(member['name']![0])),
        title: GestureDetector(
          onTap: () => _launchMaps(member['address']!), // Launch maps on name tap
          child: Text('${member['name']} (${member['id']})'),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.arrow_upward, color: Colors.green),
            SizedBox(width: 5),
            Text(member['inTime']!),
            SizedBox(width: 10),
            Icon(Icons.arrow_downward, color: Colors.red),
            SizedBox(width: 5),
            Text(member['outTime']!),
          ],
        ),
        trailing: GestureDetector(
          onTap: () => _launchMaps(member['address']!), // Launch maps on calendar icon tap
          child: Icon(Icons.calendar_today_outlined),
        ),
      ),
    );
  }
}
