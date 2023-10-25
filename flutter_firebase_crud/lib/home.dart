import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/baket.dart';

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
      var records =
          await FirebaseFirestore.instance.collection("baket_items").get();
      print("Fetched ${records.docs.length} records");
      mapRecords(records);
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
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text('Item $index'),
            subtitle: Text('Subtitle $index'),
          );
        },
        itemCount: baketItems.length,
      ),
    );
  }
}
