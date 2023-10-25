import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/baket.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Baket> baketItems = [];
  @override
  void initState() {
    super.initState();
    fetchRecords();
  }

  fetchRecords() async {
    try {
      var records = await FirebaseFirestore.instance
          .collection("baket_items")
          .snapshots()
          .listen((records) {
        mapRecords(records);
      });
    } catch (e) {
      print("Error fetching records: $e");
    }
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => Baket(
            id: item.id,
            name: item['name'],
            quantity: item['quantity'],
          ),
        )
        .toList();

    setState(() {
      baketItems = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baket Items"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: showItemDiolog, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                    onPressed: (c) {
                      deleteItem(baketItems[index].id);
                    },
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: "Delete",
                    spacing: 8)
              ],
            ),
            child: ListTile(
              title: Text(baketItems[index].name),
              subtitle: Text(baketItems[index].quantity),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showUpdateDialog(baketItems[index]);
                },
              ),
            ),
          );
        },
        itemCount: baketItems.length,
      ),
    );
  }

  showItemDiolog() {
    var nameController = TextEditingController();
    var quantityController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                ),
                TextField(
                  controller: quantityController,
                ),
                ElevatedButton(
                  onPressed: () {
                    var name = nameController.text.trim();
                    var quantity = quantityController.text.trim();
                    adItems(
                      name,
                      quantity,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          );
        });
  }

  adItems(String name, String quantity) {
    var item = Baket(id: "id", name: name, quantity: quantity);
    FirebaseFirestore.instance.collection("baket_items").add(item.toJson());
  }

  deleteItem(String id) {
    FirebaseFirestore.instance.collection("baket_items").doc(id).delete();
  }

  showUpdateDialog(Baket item) {
    var nameController = TextEditingController(text: item.name);
    var quantityController = TextEditingController(text: item.quantity);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: quantityController,
              ),
              ElevatedButton(
                onPressed: () {
                  var newName = nameController.text.trim();
                  var newQuantity = quantityController.text.trim();
                  updateItem(item.id, newName, newQuantity);
                  Navigator.pop(context);
                },
                child: const Text("Update"),
              ),
            ],
          ),
        );
      },
    );
  }

  updateItem(String id, String newName, String newQuantity) {
    var item = Baket(id: id, name: newName, quantity: newQuantity);
    FirebaseFirestore.instance
        .collection("baket_items")
        .doc(id)
        .update(item.toJson());
  }
}
