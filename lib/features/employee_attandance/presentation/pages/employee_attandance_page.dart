import 'package:flutter/material.dart';
// for DateFormat & daysInMonth
import 'package:gulf_way/common/utils/custom_appbar.dart';

class EmployeeAttendancePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EmployeeAttendancePage());
  const EmployeeAttendancePage({super.key});

  @override
  State<EmployeeAttendancePage> createState() => _EmployeeAttendancePageState();
}

class _EmployeeAttendancePageState extends State<EmployeeAttendancePage> {
  String? selectedSite;

  // Sample sites
  final List<String> sites = ["Site A", "Site B", "Site C"];

  // Sample employees assigned to sites
  final Map<String, List<Map<String, dynamic>>> employeesBySite = {
    "Site A": [
      {"id": "E001", "name": "John Doe"},
      {"id": "E002", "name": "Alice Smith"},
    ],
    "Site B": [
      {"id": "E003", "name": "Michael Brown"},
      {"id": "E004", "name": "Sophia Johnson"},
    ],
    "Site C": [
      {"id": "E005", "name": "David Wilson"},
      {"id": "E006", "name": "Emma Davis"},
    ],
  };

  // Store attendance data (employeeId -> date -> present/absent)
  Map<String, Map<int, bool>> attendanceData = {};

  // Get number of days in current month
  int getDaysInMonth(int year, int month) {
    return DateTimeRange(
      start: DateTime(year, month, 1),
      end: DateTime(year, month + 1, 1),
    ).duration.inDays;
  }

  @override
  Widget build(BuildContext context) {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    int daysInMonth = getDaysInMonth(year, month);

    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Site Selection Dropdown
            DropdownButton<String>(
              value: selectedSite,
              hint: const Text("Select Site"),
              isExpanded: true,
              items: sites
                  .map(
                    (site) => DropdownMenuItem(value: site, child: Text(site)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSite = value;
                  attendanceData.clear(); // reset attendance when site changes
                });
              },
            ),
            const SizedBox(height: 16),

            // Attendance Table
            if (selectedSite != null)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20,
                    headingRowHeight: 40,
                    dataRowHeight: 50,
                    columns: [
                      const DataColumn(label: Text("Employee")),
                      ...List.generate(
                        daysInMonth,
                        (index) => DataColumn(label: Text("${index + 1}")),
                      ),
                    ],
                    rows: employeesBySite[selectedSite]!
                        .map(
                          (employee) => DataRow(
                            cells: [
                              DataCell(Text(employee["name"])),
                              ...List.generate(
                                daysInMonth,
                                (day) => DataCell(
                                  Checkbox(
                                    value:
                                        attendanceData[employee["id"]]?[day +
                                            1] ??
                                        false,
                                    onChanged: (value) {
                                      setState(() {
                                        attendanceData[employee["id"]] ??= {};
                                        attendanceData[employee["id"]]![day +
                                                1] =
                                            value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
