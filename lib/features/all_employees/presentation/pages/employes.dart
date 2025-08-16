import 'package:flutter/material.dart';
import 'package:gulf_way/common/utils/custom_appbar.dart';
import 'package:gulf_way/core/theme/app_colors.dart';
import 'package:gulf_way/core/theme/app_theme.dart';
import 'package:gulf_way/core/widgets/custom_button.dart';
import 'package:gulf_way/core/widgets/testing_data/testing_employees.dart';

class EmployeesList extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EmployeesList());
  const EmployeesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            scrollDirection:
                Axis.horizontal, // enables scrolling if table is wide
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
              ),
              child: SingleChildScrollView(
                child: DataTable(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                  rows: List.generate(employees.length, (index) {
                    final employee = employees[index];
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
                                  // TODO: implement action
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
    );
  }
}
