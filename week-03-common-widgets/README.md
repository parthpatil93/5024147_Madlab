# Week 3: Common Widgets

This folder is an independent Flutter project named `medminder_widgets` for
Practical 3. The app is a MedMinder UI-components showcase built from Flutter's
Material widgets; it has no dependency on another weekly project.

## Run in GitHub Codespaces

Install Flutter in the Codespace and confirm the setup with `flutter doctor
-v`. Then run these commands from the repository root:

```sh
cd week-03-common-widgets
flutter pub get
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Open forwarded port 8080 in the Codespaces Ports panel. If Chrome is installed,
`flutter run -d chrome` is also available. To debug in VS Code, choose a
Flutter device and press F5; inspect `debugPrint` messages and exceptions in
the Debug Console.

Run project checks from this directory:

```sh
dart format lib/main.dart test/widget_test.dart
flutter analyze
flutter test
flutter build web --release
```

The form accepts a reminder label. Submitting a non-empty label adds it to the
visible list and displays confirmation; submitting an empty field asks for
input. The component mapping and environment command results are in
[`practical-report.md`](practical-report.md).