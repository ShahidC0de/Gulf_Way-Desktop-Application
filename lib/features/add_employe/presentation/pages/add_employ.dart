import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_colors.dart';
import 'package:gulf_way/core/utils/custom_appbar.dart';
import 'package:gulf_way/core/widgets/custom_button.dart';
import 'package:gulf_way/features/add_employe/presentation/widgets/customfield.dart';
import 'package:gulf_way/features/add_employe/presentation/widgets/dot_indicator.dart';
import 'package:gulf_way/features/add_employe/presentation/widgets/dropdown_searchfield.dart';
import 'package:half_wheel_arc_chart/half_wheel_chart.dart';

class AddEmployee extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddEmployee());
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  @override
  void dispose() {
    _nameController.dispose();
    _roomNoController.dispose();
    _companyController.dispose();
    _statusController.dispose();
    _contactController.dispose();
    _currentSiteController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNoController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _currentSiteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    Widget buildColumn({required Widget child, Color? color}) {
      return Flexible(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 300, maxWidth: 400),
          child: Container(
            height: screenHeight - 300,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: color ?? Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: appbar,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildColumn(
                color: AppColors.darkBlue,
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HalfWheelArcChart(
                          values: [100, 30, 50],
                          colors: [
                            AppColors.brightCyan,
                            Colors.orange,
                            Colors.amberAccent,
                          ],

                          centerText: 'Employees ',
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          animationValue: 0.5,
                        ),
                        const SizedBox(height: 20),
                        DotIndicator(
                          text: 'Total ',
                          color: AppColors.brightCyan,
                        ),
                        // assigned
                        DotIndicator(text: 'Assigned ', color: Colors.orange),
                        // freed
                        DotIndicator(text: 'Idle ', color: Colors.amberAccent),
                      ],
                    ),
                  ),
                ), // Left panel
              ),
              buildColumn(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Customfield(
                      controller: _nameController,
                      labelText: 'Employee Name',
                      icon: Icons.person,
                    ),
                    Customfield(
                      controller: _roomNoController,
                      labelText: 'Employee Room No',
                      icon: Icons.roofing,
                    ),
                    Customfield(
                      controller: _companyController,
                      labelText: 'Company',
                      icon: Icons.business,
                    ),
                    CustomDropdownField(
                      icon: Icons.business,
                      labelText: 'Designation',
                      controller: SingleValueDropDownController(),
                      items: [
                        DropDownValueModel(name: 'Mason', value: 'mason'),
                        DropDownValueModel(name: 'Labour', value: 'labour'),
                        DropDownValueModel(
                          name: 'Electrician',
                          value: 'electrician',
                        ),
                        DropDownValueModel(name: 'Plumber', value: 'plumber'),
                      ],
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              buildColumn(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Customfield(
                      controller: _statusController,
                      labelText: 'Status',
                      icon: Icons.check_circle,
                    ),
                    Customfield(
                      controller: _contactController,
                      labelText: 'Contact Number',
                      icon: Icons.phone,
                    ),
                    Customfield(
                      controller: _currentSiteController,
                      labelText: 'Current Site',
                      icon: Icons.location_on,
                    ),
                    CustomButton(onPressed: () {}, buttonTitle: 'Add Employee'),
                  ],
                ), // Right panel
              ),
            ],
          ),
        ),
      ),
    );
  }
}
