import 'package:flutter/material.dart';
import 'package:gulf_way/features/add_employe/presentation/pages/add_employ.dart';
import 'package:gulf_way/features/dfdkjf/presentation/pages/view_employes.dart';

class DashboardScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => DashboardScreen());
  final String userName = "SHAHID ZADA";
  final String userEmail = "shahidzada@example.com";
  final String profileImage = "https://via.placeholder.com/150";

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/gulf_title.jpg', scale: 1.8),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userName.toUpperCase()),
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(profileImage),
              ),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Mark Attendance"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("View Attendance"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Leave Requests"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            return GridView.count(
              crossAxisCount: width > 800
                  ? 4
                  : width > 500
                  ? 2
                  : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                dashboardCard(Icons.person_add, "ADD EMPLOYEE", () {
                  Navigator.push(context, AddEmployee.route());
                }),
                dashboardCard(Icons.history, "VIEW ATTENDANCE", () {
                  EmployeePrinter.printEmployees(context, [
                    {
                      'name': 'Shahid Zada',
                      'email': 'shahidzada@example.com',
                      'position': 'Software Engineer',
                    },
                    {
                      'name': 'John Doe',
                      'email': 'johndoe@example.com',
                      'position': 'Product Manager',
                    },
                    {
                      'name': 'Alice Smith',
                      'email': 'alicesmith@example.com',
                      'position': 'UX Designer',
                    },
                  ]);
                }),
                dashboardCard(Icons.exit_to_app, "LEAVE REQUESTS", () {}),
                dashboardCard(Icons.person, "PROFILE", () {}),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget dashboardCard(IconData icon, String title, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
