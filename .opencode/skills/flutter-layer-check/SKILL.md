---
name: flutter-layer-check
description: Reviews Flutter code for layer violations between View, Controller, Repository, and ApiClient. Use when asked to review, audit, or check the architecture of Flutter code, especially the DPL Inspection app (Day 2).
---

# Flutter Layer Check

Review only. Do not edit code unless asked.

## Layers
View = widgets. Controller = state holder (same as ViewModel in official Flutter docs). Repository = data source of truth, maps errors. ApiClient = HTTP and storage access.
Allowed direction: View -> Controller -> Repository -> ApiClient.

## Rules
1. View: no http, dio, ApiClient, or storage imports or calls.
2. View: no direct Repository calls. Go through the Controller.
3. View: no business logic or JSON parsing, including in build(), initState(), and callbacks.
4. State is not created in build(). Dispose every controller and listener.
5. Repository depends on an injected ApiClient abstraction, not a concrete instance.
6. Errors are mapped to typed failures, not raw strings in the UI.
7. Models are immutable (final fields).

## Report
First classify each file into a layer. Then output one line per rule 1-7:
`Rule N: VIOLATION | OK | N/A - reason (file:line)`
- VIOLATION: offending code exists.
- OK: rule is relevant and satisfied.
- N/A: the file has no such layer.
Use no other statuses. Add a one-line fix under each VIOLATION.
Put findings outside the rules under "Other notes".
Limit "Other notes" to 3 items.
End with a one-sentence summary. Write in the user's language.

## When unsure
Check current Flutter architecture docs via Context7 (/flutter/website).
