# flutter-layer-check

Agent skill untuk mereview pemisahan layer View / Controller / Repository / ApiClient pada kode Flutter. Dibuat untuk DPL Workshop (Flutter Day 2).

## Pasang
Salin folder `.opencode/skills/flutter-layer-check` ke project Flutter kamu (opencode juga membaca `.claude/skills` dan `.agents/skills`). Salin `opencode.json` bila ingin Context7.

## Pakai
Jalankan `opencode`, lalu:
`Pakai skill flutter-layer-check untuk mereview lib/`

## Demo 3 menit
1. `examples/bad_widget.dart`: skill harus menandai pelanggaran aturan 1, 3, 4.
2. `examples/good_layers.dart`: skill harus melaporkan tidak ada pelanggaran.

## Catatan
Skill hanya file Markdown berisi instruksi. Tool agent lain yang mendukung skill bisa memakainya; di chat AI biasa isinya bisa ditempel sebagai prompt.
