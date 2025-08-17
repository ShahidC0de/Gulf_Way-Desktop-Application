import 'package:flutter/material.dart';
import 'package:gulf_way/common/utils/custom_appbar.dart';
import 'package:gulf_way/core/theme/app_colors.dart';
import 'package:gulf_way/core/theme/app_theme.dart';
import 'package:gulf_way/core/widgets/custom_button.dart';
import 'package:gulf_way/core/widgets/testing_data/testing_employees.dart';
import 'package:gulf_way/features/all_employees/presentation/pages/edit_employee.dart';

class EmployeesList extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EmployeesList());
  const EmployeesList({super.key});

  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  String searchName = "";
  String searchRoom = "";
  String searchSite = "";

  @override
  Widget build(BuildContext context) {
    // filter employees list
    final filteredEmployees = employees.where((employee) {
      final name = (employee['name'] ?? '').toLowerCase();
      final room = (employee['roomNo'] ?? '').toLowerCase();
      final site = (employee['currentSite'] ?? '').toLowerCase();

      return (searchName.isEmpty || name.contains(searchName.toLowerCase())) &&
          (searchRoom.isEmpty || room.contains(searchRoom.toLowerCase())) &&
          (searchSite.isEmpty || site.contains(searchSite.toLowerCase()));
    }).toList();

    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          // 🔎 search bar section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Name Search
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Search by Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    onChanged: (value) {
                      setState(() => searchName = value);
                    },
                  ),
                ),
                const SizedBox(width: 10),

                // Room Search
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Search by Room No",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.meeting_room),
                    ),
                    onChanged: (value) {
                      setState(() => searchRoom = value);
                    },
                  ),
                ),
                const SizedBox(width: 10),

                // Site Search
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Search by Site",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    onChanged: (value) {
                      setState(() => searchSite = value);
                    },
                  ),
                ),
              ],
            ),
          ),

          // 📊 table section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox.expand(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    child: SingleChildScrollView(
                      child: DataTable(
                        headingRowColor: WidgetStateColor.resolveWith(
                          (states) => AppColors.darkBlue,
                        ),
                        dividerThickness: 1.5,
                        headingTextStyle: AppTheme.titleTextStyle.copyWith(
                          color: Colors.white,
                        ),
                        dataTextStyle: AppTheme.normalTextStyle,
                        columnSpacing: 40,
                        columns: const [
                          DataColumn(label: Text('S No')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Company')),
                          DataColumn(label: Text('Designation')),
                          DataColumn(label: Text('Room No')),
                          DataColumn(label: Text('Contact No')),
                          DataColumn(label: Text('Current Site')),
                        ],
                        rows: List.generate(filteredEmployees.length, (index) {
                          final employee = filteredEmployees[index];
                          return DataRow(
                            cells: [
                              DataCell(Text((index + 1).toString())),
                              DataCell(Text(employee['name'] ?? '-')),
                              DataCell(Text(employee['company'] ?? '-')),
                              DataCell(Text(employee['designation'] ?? '-')),
                              DataCell(Text(employee['roomNo'] ?? '-')),
                              DataCell(Text(employee['contact'] ?? '-')),
                              DataCell(
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        employee['currentSite'] ?? '-',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    CustomButton(
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                        ).push(EditEmployee.route(employee));
                                      },
                                      buttonTitle: 'Edit',
                                      width: 100,
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
