import 'package:flutter/material.dart';

class PantallaSeis extends StatefulWidget {
  const PantallaSeis({super.key});

  @override
  State<PantallaSeis> createState() => _PantallaSeisState();
}

class _PantallaSeisState extends State<PantallaSeis> {
  int? sortColumnIndex = 0;
  bool sortAscending = false;
  List<Name> names = <Name>[
    Name(firstName: "Murshed", lastName: "Islam", age: 27),
    Name(firstName: "Ibn", lastName: "Sina", age: 27),
    Name(firstName: "Amil", lastName: "Hossain", age: 28),
    Name(firstName: "Md.", lastName: "Siam", age: 27),
    Name(firstName: "Ashik", lastName: "Mahmud", age: 27),
    Name(firstName: "Billal", lastName: "Hossain", age: 25),
    Name(firstName: "Samiul", lastName: "Kaiser", age: 35),
    Name(firstName: "Kamal", lastName: "Hossain", age: 31),
    Name(firstName: "Sabbir", lastName: "Ali", age: 20),
    Name(firstName: "Akiq", lastName: "Islam", age: 27),
    Name(firstName: "Sabrina", lastName: "Ilieas", age: 27),
    Name(firstName: "Kiamot", lastName: "Ali", age: 28),
    Name(firstName: "Kowsar", lastName: "Habbab", age: 27),
    Name(firstName: "Kifaet", lastName: "Kibria", age: 27),
    Name(firstName: "Munna", lastName: "Hossain", age: 25),
    Name(firstName: "Musharaf", lastName: "Ali", age: 35),
    Name(firstName: "Kamal", lastName: "Hossain", age: 31),
    Name(firstName: "Sammi", lastName: "Istiak", age: 20),
  ];

  void sort<T>(Comparable<T> Function(Name n) getField, int columnIndex,
      bool ascending) {
    setState(() {
      sortColumnIndex = columnIndex;
      sortAscending = ascending;
      names.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Data Table')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columnSpacing: width * 0.07,
              onSelectAll: (b) {},
              sortColumnIndex: sortColumnIndex,
              sortAscending: sortAscending,
              columns: <DataColumn>[
                DataColumn(
                  label: const Text("First Name"),
                  numeric: false,
                  onSort: (columnIndex, ascending) => sort<String>(
                      (name) => name.firstName, columnIndex, ascending),
                  tooltip: "To display first name of the Name",
                ),
                DataColumn(
                  label: const Text("Last Name"),
                  numeric: false,
                  onSort: (columnIndex, ascending) => sort<String>(
                      (name) => name.lastName, columnIndex, ascending),
                  tooltip: "To display last name of the Name",
                ),
                DataColumn(
                  label: const Text("Age"),
                  numeric: true,
                  onSort: (columnIndex, ascending) =>
                      sort<num>((name) => name.age, columnIndex, ascending),
                  tooltip: "To display age",
                ),
              ],
              rows: names
                  .map(
                    (name) => DataRow(
                      onSelectChanged: (b) {},
                      cells: [
                        DataCell(
                          Text(name.firstName),
                          showEditIcon: false,
                          placeholder: false,
                        ),
                        DataCell(
                          Text(name.lastName),
                          showEditIcon: false,
                          placeholder: false,
                        ),
                        DataCell(
                          Text(name.age.toString()),
                          showEditIcon: false,
                          placeholder: false,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar!'),
            ),
          ],
        ),
      ),
    );
  }
}

class Name {
  String firstName;
  String lastName;
  int age;
  Name({required this.firstName, required this.lastName, required this.age});
}
