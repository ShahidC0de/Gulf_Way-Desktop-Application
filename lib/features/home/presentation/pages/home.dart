import 'package:flutter/material.dart';
import 'package:gulf_way/core/utils/custom_appbar.dart';
import 'package:gulf_way/features/home/add_employe/presentation/pages/add_employ.dart';
import 'package:gulf_way/features/home/presentation/widgets/home_lengthy_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            HomeLengthyButton(
              onTap: () {
                Navigator.push(context, AddEmployee.route());
              },
              imagePath: 'assets/images/labour.png',
              correspondingIcon: Icons.add,
            ),
          ],
        ),
      ),
    );
  }
}
