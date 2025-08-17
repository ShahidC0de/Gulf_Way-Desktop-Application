import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_colors.dart';
import 'package:gulf_way/core/theme/app_theme.dart';

class EditEmployee extends StatefulWidget {
  // THE EMPLOYEE EDIT SCREEN TO EDIT IS THE NEW TASK......
  final Map<String, dynamic> employee;

  static route(Map<String, dynamic> employee) =>
      MaterialPageRoute(builder: (context) => EditEmployee(employee: employee));

  const EditEmployee({super.key, required this.employee});

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController designationController;
  late TextEditingController salaryController;

  String? selectedDepartment;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.employee['name']);
    emailController = TextEditingController(text: widget.employee['roomNo']);
    phoneController = TextEditingController(text: widget.employee['company']);
    designationController = TextEditingController(
      text: widget.employee['designation'],
    );
    salaryController = TextEditingController(
      text: widget.employee['contactNo']?.toString(),
    );
    selectedDepartment = widget.employee['contactNo'];
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    designationController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final updatedEmployee = {
      'name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'designation': designationController.text,
      'salary': salaryController.text,
      'department': selectedDepartment,
    };
    Navigator.pop(context, updatedEmployee); // return updated employee
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Employee",
          style: AppTheme.titleTextStyle.copyWith(color: AppColors.darkBlue),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
            DropdownButtonFormField<String>(
              value: selectedDepartment,
              decoration: const InputDecoration(labelText: "Department"),
              items: ["HR", "IT", "Finance", "Sales"]
                  .map(
                    (dept) => DropdownMenuItem(value: dept, child: Text(dept)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedDepartment = value;
                });
              },
            ),
            TextFormField(
              controller: designationController,
              decoration: const InputDecoration(labelText: "Designation"),
            ),
            TextFormField(
              controller: salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Salary"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _saveChanges,
              icon: const Icon(Icons.save),
              label: const Text("Save Changes"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
