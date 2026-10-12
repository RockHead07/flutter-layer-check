---
name: flutter-layer-check
description: Review kode Flutter untuk pelanggaran pemisahan layer View, Controller, Repository, ApiClient. Pakai saat mereview kode hari 2 DPL Inspection.
---

## Aturan yang dicek
1. View (widget) tidak boleh import atau memanggil http, dio, ApiClient, atau storage langsung.
2. View tidak boleh memanggil Repository langsung. Lewat Controller.
3. Tidak ada logic bisnis atau parsing JSON di build().
4. State tidak dibuat di dalam build(). Controller, TextEditingController, dan listener harus di-dispose.
5. Repository bergantung pada abstraksi ApiClient (bisa di-inject dan di-fake), bukan instansiasi langsung.
6. Error dipetakan ke tipe failure, bukan String mentah ke UI.
7. Model immutable (field final).

## Cara kerja
- Scan lib/ per file, klasifikasikan tiap file ke layer dari nama dan importnya.
- Laporkan per file: aturan yang dilanggar, nomor baris, saran perbaikan singkat.
- Jika tidak ada pelanggaran, tulis "tidak ada pelanggaran" untuk file itu.
- Jangan edit kode kecuali diminta.
- Jika ragu soal best practice terbaru, cek dokumentasi Flutter lewat Context7 (/flutter/website).

## Catatan
Istilah Controller di workshop ini setara ViewModel di dokumentasi resmi Flutter.
