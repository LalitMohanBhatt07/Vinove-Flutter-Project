import 'package:flutter/material.dart';
import '../widgets/member_card.dart';
import '../widgets/date_selector.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/show_map_button.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<Map<String, String>> members = [
    {'name': 'Lalit Bhatt', 'id': 'WSL0076', 'inTime': '09:30 am', 'outTime': '06:40 pm', 'address': 'Dehradun, Uttarakhand, India'},
    {'name': 'Atul Oli', 'id': 'WSL0077', 'inTime': '09:30 am', 'outTime': '06:40 pm', 'address': 'Karachi, Pakistan'},
    {'name': 'Amit Sharma', 'id': 'WSL0078', 'inTime': '09:30 am', 'outTime': '06:40 pm', 'address': 'Beijing, China'},
    // Add more members here...
  ];

  List<Map<String, String>> filteredMembers = [];

  @override
  void initState() {
    super.initState();
    filteredMembers = members; // Initially, all members are displayed.
  }

  void searchMember(String query) {
    final results = members.where((member) {
      final memberName = member['name']!.toLowerCase();
      final input = query.toLowerCase();
      return memberName.contains(input); // Search by name
    }).toList();

    setState(() {
      filteredMembers = results;
    });
  }

  void showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String searchText = "";
        return AlertDialog(
          title: Text('Search User'),
          content: TextField(
            decoration: InputDecoration(hintText: "Enter user name"),
            onChanged: (value) {
              searchText = value;
            },
          ),
          actions: [
            TextButton(
              child: Text('Search'),
              onPressed: () {
                Navigator.of(context).pop();
                searchMember(searchText);
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



void showAllMembersDialog(BuildContext context, List<Map<String, String>> members) {
  showDialog(
    context: context,
    builder: (context) {
      String searchQuery = "";
      List<Map<String, String>> filteredMembers = members;

      void filterMembers(String query) {
        filteredMembers = members.where((member) {
          final memberName = member['name']!.toLowerCase();
          final input = query.toLowerCase();
          return memberName.contains(input);
        }).toList();
      }

      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Dialog Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.group, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'All Members',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                        filterMembers(searchQuery);
                      });
                    },
                  ),
                ),
                // Members List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: filteredMembers.length,
                    itemBuilder: (context, index) {
                      final member = filteredMembers[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Text(
                            member['name']![0], // First letter of the name
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(member['name']!),
                        subtitle: Text(member['address'] ?? ''),
                      );
                    },
                  ),
                ),
                // Close Button
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'ATTENDANCE',
        onSearchPressed: showSearchDialog, // Search function passed here
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Cameron Williamson"),
              accountEmail: Text("cameronwilliamson@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_pic.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Timer'),
              onTap: () {
                Navigator.pop(context);
                // Handle Timer section
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Attendance'),
              onTap: () {
                Navigator.pop(context);
                // Handle Attendance section
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Activity'),
              onTap: () {
                Navigator.pop(context);
                // Handle Activity section
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart),
              title: Text('Timesheet'),
              onTap: () {
                Navigator.pop(context);
                // Handle Timesheet section
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Report'),
              onTap: () {
                Navigator.pop(context);
                // Handle Report section
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Jobsite'),
              onTap: () {
                Navigator.pop(context);
                // Handle Jobsite section
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Team'),
              onTap: () {
                Navigator.pop(context);
                // Handle Team section
              },
            ),
            ListTile(
              leading: Icon(Icons.time_to_leave),
              title: Text('Time off'),
              onTap: () {
                Navigator.pop(context);
                // Handle Time off section
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Schedules'),
              onTap: () {
                Navigator.pop(context);
                // Handle Schedules section
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.request_page),
              title: Text('Request to join Organization'),
              onTap: () {
                Navigator.pop(context);
                // Handle join organization request
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              onTap: () {
                Navigator.pop(context);
                // Handle Change Password
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                // Handle Logout action
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('FAQ and Help'),
              onTap: () {
                // Handle FAQ and Help section
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              onTap: () {
                // Handle Privacy Policy section
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Version 2.10(1)'),
              onTap: () {
                // Handle Version 2.10 details
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              DateSelector(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                 onPressed: () => showAllMembersDialog(context, members), // Show all members dialog when pressed
                  child: Text('All Members'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredMembers.length,
                  itemBuilder: (context, index) {
                    return MemberCard(member: filteredMembers[index]);
                  },
                ),
              ),
            ],
          ),
          ShowMapButton(members: filteredMembers),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onSearchPressed;

  CustomAppBar({required this.title, required this.onSearchPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text(title),
      backgroundColor: Colors.purple,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: onSearchPressed, // Triggers the search dialog
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
