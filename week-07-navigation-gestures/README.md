# Week 7: Navigation and Gestures

This is an independent Flutter project for Practical 7. It demonstrates
MedMinder navigation and gestures without depending on another weekly project.

## Run in Codespaces

Install Flutter and Dart in the Codespace, then check the environment:

```sh
flutter doctor -v
```

From the repository root, run:

```sh
cd week-07-navigation-gestures
flutter pub get
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Open forwarded port 8080 in the Codespaces Ports panel. If Chrome is available,
`flutter run -d chrome` is another option. In VS Code, choose a Flutter device
and press F5 to debug. The gesture card accepts mouse clicks and touchscreen
gestures.

Run the project checks from this directory:

```sh
dart format lib/main.dart lib/models/medicine.dart \
	lib/screens/home_screen.dart lib/screens/medicine_detail_screen.dart \
	test/widget_test.dart
flutter analyze
flutter test
flutter build web --release
```

Follow [`evidence/manual-demo-checklist.md`](evidence/manual-demo-checklist.md)
to demonstrate direct and named navigation, back navigation, and each gesture.
The code walkthrough and environment-specific command results are in
[`practical-report.md`](practical-report.md).