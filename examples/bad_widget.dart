// CONTOH SALAH (sengaja). Skill harus menandai file ini.
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
    // Pelanggaran: HTTP langsung di widget
    http.get(Uri.parse('http://10.0.2.2:8000/inspections')).then((res) {
      setState(() => items = jsonDecode(res.body)); // parsing JSON di View
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pelanggaran: controller dibuat di dalam build(), tidak pernah di-dispose
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
