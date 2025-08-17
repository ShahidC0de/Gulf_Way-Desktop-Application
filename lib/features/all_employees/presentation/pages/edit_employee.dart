import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_colors.dart';
import 'package:gulf_way/core/theme/app_theme.dart';
import 'package:gulf_way/core/widgets/custom_button.dart';
import 'package:gulf_way/features/add_employe/presentation/widgets/customfield.dart';

class EditEmployee extends StatefulWidget {
  final Map<String, dynamic> employee;

  static route(Map<String, dynamic> employee) =>
      MaterialPageRoute(builder: (context) => EditEmployee(employee: employee));

  const EditEmployee({super.key, required this.employee});

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  late TextEditingController nameController;
  late TextEditingController roomController;
  late TextEditingController companyController;
  late TextEditingController designationController;
  late TextEditingController contactController;
  late TextEditingController siteController;

  String? selectedDepartment;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.employee['name']);
    roomController = TextEditingController(text: widget.employee['roomNo']);
    companyController = TextEditingController(text: widget.employee['company']);
    designationController = TextEditingController(
      text: widget.employee['designation'],
    );
    siteController = TextEditingController(
      text: widget.employee['currentSite']?.toString(),
    );
    contactController = TextEditingController(
      text: widget.employee['contact']?.toString(),
    );
    selectedDepartment = widget.employee['currentSite'];
  }

  @override
  void dispose() {
    nameController.dispose();
    roomController.dispose();
    companyController.dispose();
    designationController.dispose();
    siteController.dispose();
    contactController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final updatedEmployee = {
      'name': nameController.text,
      'roomNo': roomController.text,
      'company': companyController.text,
      'designation': designationController.text,
      'currentSite': siteController.text,
      'department': selectedDepartment,
      'contact': contactController.text,
    };
    Navigator.pop(context, updatedEmployee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Employee",
          style: AppTheme.titleTextStyle.copyWith(color: AppColors.darkBlue),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Card(
            color: Colors.white,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Profile avatar
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.darkBlue.withOpacity(0.1),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Input fields
                  Customfield(
                    icon: Icons.person,
                    controller: nameController,
                    labelText: 'Employee Name',
                  ),
                  const SizedBox(height: 12),

                  Customfield(
                    icon: Icons.meeting_room,
                    controller: roomController,
                    labelText: 'Room No',
                  ),
                  const SizedBox(height: 12),

                  Customfield(
                    icon: Icons.work_outline,
                    controller: designationController,
                    labelText: 'Designation',
                  ),
                  const SizedBox(height: 12),

                  Customfield(
                    icon: Icons.apartment,
                    controller: companyController,
                    labelText: 'Company',
                  ),
                  const SizedBox(height: 12),

                  Customfield(
                    icon: Icons.phone,
                    controller: contactController,
                    labelText: "Contact",
                  ),
                  const SizedBox(height: 12),

                  Customfield(
                    icon: Icons.location_on,
                    controller: siteController,
                    labelText: "Current Site",
                  ),
                  const SizedBox(height: 20),

                  // Save button
                  CustomButton(
                    onPressed: _saveChanges,
                    buttonTitle: "Save Changes",
                    width: double.infinity,
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
