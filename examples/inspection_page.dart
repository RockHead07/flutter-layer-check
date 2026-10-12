import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InspectionPage extends StatefulWidget {
  const InspectionPage({super.key});
  @override
  State<InspectionPage> createState() => _InspectionPageState();
}

class _InspectionPageState extends State<InspectionPage> {
  List items = [];

  @override
  void initState() {
    super.initState();
    http.get(Uri.parse('http://10.0.2.2:8000/inspections')).then((res) {
      setState(() => items = jsonDecode(res.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    final noteController = TextEditingController();
    return Scaffold(
      body: Column(children: [
        TextField(controller: noteController),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, i) => Text(items[i]['name']),
          ),
        ),
      ]),
    );
  }
}
