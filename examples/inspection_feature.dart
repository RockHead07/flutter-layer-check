import 'package:flutter/material.dart';

abstract class ApiClient {
  Future<List<Map<String, Object?>>> getInspections();
}

class InspectionFailure implements Exception {
  const InspectionFailure(this.message);
  final String message;
}

class Inspection {
  const Inspection({required this.id, required this.name});
  final int id;
  final String name;
}

class InspectionRepository {
  InspectionRepository(this._api);
  final ApiClient _api;

  Future<List<Inspection>> fetchAll() async {
    try {
      final raw = await _api.getInspections();
      return raw
          .map((m) => Inspection(id: m['id'] as int, name: m['name'] as String))
          .toList();
    } catch (_) {
      throw const InspectionFailure('Gagal memuat data');
    }
  }
}

class InspectionController extends ChangeNotifier {
  InspectionController(this._repo);
  final InspectionRepository _repo;
  List<Inspection> items = const [];
  InspectionFailure? error;

  Future<void> load() async {
    try {
      items = await _repo.fetchAll();
      error = null;
    } on InspectionFailure catch (f) {
      error = f;
    }
    notifyListeners();
  }
}

class InspectionView extends StatefulWidget {
  const InspectionView({super.key, required this.controller});
  final InspectionController controller;
  @override
  State<InspectionView> createState() => _InspectionViewState();
}

class _InspectionViewState extends State<InspectionView> {
  final _note = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.controller.load();
  }

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (_, __) => Scaffold(
        body: Column(children: [
          TextField(controller: _note),
          if (widget.controller.error != null) Text(widget.controller.error!.message),
          Expanded(
            child: ListView.builder(
              itemCount: widget.controller.items.length,
              itemBuilder: (_, i) => Text(widget.controller.items[i].name),
            ),
          ),
        ]),
      ),
    );
  }
}

