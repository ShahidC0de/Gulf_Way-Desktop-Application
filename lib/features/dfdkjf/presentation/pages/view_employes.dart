import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class EmployeePrinter {
  static Future<void> printEmployees(
    BuildContext context,
    List<Map<String, String>> employees,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context _) {
          // ignore: deprecated_member_use
          return pw.Table.fromTextArray(
            headers: employees.first.keys.toList(),
            data: employees.map((e) => e.values.toList()).toList(),
          );
        },
      ),
    );

    // Select printer
    final printer = await Printing.pickPrinter(context: context);

    // If a printer was selected
    if (printer != null) {
      await Printing.directPrintPdf(
        printer: printer,
        onLayout: (_) async => pdf.save(),
      );
    }
  }
}
