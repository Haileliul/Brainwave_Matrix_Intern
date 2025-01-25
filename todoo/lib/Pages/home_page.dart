import "package:flutter/material.dart";
import '../Util/database_helper.dart';
import '../Provider/PeriferanceProvider.dart';
import '../Util/snacksbar.dart';
import '../Widgets/DrawerContainer.dart';
import '../Widgets/textfild.dart';
import '../Widgets/button.dart';

class MyHomePage extends StatefulWidget {
  final Periferance periferance;
  const MyHomePage({super.key, required this.periferance});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _items = [];

  final Set<int> _selectedIndices = {}; // Track selected indices

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  void _refreshItems() async {
    final data = await _dbHelper.getItems();
    setState(() {
      _items = data;
    });
  }

  void _addItem(String name, String description) async {
    await _dbHelper.insertItem({
      'name': name,
      'description': description,
    });
    _refreshItems();
  }

  void _updateItem(int id, String name, String description) async {
    await _dbHelper.updateItem({
      'id': id,
      'name': name,
      'description': description,
    });
    _refreshItems();
  }

  void _deleteItem(int id) async {
    await _dbHelper.deleteItem(id);
    _refreshItems();
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController nameController = TextEditingController();
        TextEditingController descriptionController = TextEditingController();
        return AlertDialog(
          title: Text("Add A Task"),
          content: SizedBox(
            height: 130,
            child: Column(
              children: [
                Textfildform(
                  autofocus: true,
                  hinttext: "Name",
                  textcontroller: nameController,
                ),
                Textfildform(
                  autofocus: false,
                  hinttext: "Description",
                  textcontroller: descriptionController,
                ),
              ],
            ),
          ),
          actions: [
            Mybuttonn(
              child: "Submit",
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  _addItem(nameController.text, descriptionController.text);
                  showSnackbar(
                    context,
                    "Task has been Added",
                    Theme.of(context).primaryColor,
                  );
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showUpdateDialog(Map item) {
    final Name = item["name"];
    final Description = item["description"];
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController? nameController = TextEditingController();
        TextEditingController? desccriptionController = TextEditingController();
        return AlertDialog(
          content: SizedBox(
            height: 130,
            child: Column(
              children: [
                Textfildform(
                  autofocus: true,
                  hinttext: Name,
                  textcontroller: nameController,
                ),
                Textfildform(
                  autofocus: false,
                  hinttext: Description,
                  textcontroller: desccriptionController,
                )
              ],
            ),
          ),
          actions: [
            Mybuttonn(
              child: "Update",
              onPressed: () {
                _updateItem(item['id'], nameController.text,
                    desccriptionController.text);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: TextStyle(
            fontFamily: 'indian',
            fontSize: 13,
          ),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          final isSelected = _selectedIndices.contains(index);

          return Card(
            color: Theme.of(context).cardColor,
            elevation: 2,
            margin: EdgeInsets.only(bottom: 5, top: 2),
            child: ListTile(
              leading: Checkbox(
                side: BorderSide(color: Theme.of(context).primaryColor),
                value: isSelected, // Check if this item is selected
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _selectedIndices.add(index);
                      widget.periferance.setSelectedIndices(
                          _selectedIndices); // Add to selected set
                    } else {
                      _selectedIndices.remove(index);
                      widget.periferance.setSelectedIndices(
                          _selectedIndices); // Remove from selected set
                    }
                  });
                },
              ),
              title: Text("${item['name']}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      decoration: isSelected
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
              subtitle: Text("${item['description']}",
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: isSelected
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _showUpdateDialog(item),

                    // _updateItem(item['id']),
                  ),
                  IconButton(
                    splashColor: Theme.of(context).colorScheme.error,
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () => {
                      _deleteItem(item['id']),
                      showSnackbar(
                        context,
                        "Task has been delete",
                        Theme.of(context).colorScheme.error,
                      )
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      drawer: showDrawer(size),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
