import 'package:flutter/material.dart';

class GradeTable extends StatefulWidget {
  const GradeTable({Key? key}) : super(key: key);

  @override
  State<GradeTable> createState() => _GradeTableState();
}

class _GradeTableState extends State<GradeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Grades'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: DataTable(
              columns: [
                DataColumn(label: Text('Subject')),
                DataColumn(label: Text('Score')),
                DataColumn(label: Text('Grade')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('IT')),
                  DataCell(Text('A+')),
                  DataCell(Text('200')),
                ]),
                DataRow(cells: [
                  DataCell(Text('English')),
                  DataCell(Text('A')),
                  DataCell(Text('150')),
                ]),
                DataRow(cells: [
                  DataCell(Text('DSS')),
                  DataCell(Text('B')),
                  DataCell(Text('120')),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
