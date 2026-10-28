# Week 5: Layout Widgets

This directory is a standalone Flutter project for Practical 5. It builds a
responsive MedMinder dashboard using Flutter's built-in Material widgets and
does not depend on another weekly project.

## Run the project

Install Flutter and Dart, then check the environment:

```sh
flutter doctor -v
```

From this directory:

```sh
flutter pub get
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Open forwarded port 8080 from the Codespaces Ports panel. If Chrome is
available, `flutter run -d chrome` is an alternative. In VS Code, choose a
Flutter device and press F5.

## Checks

Run the formatting, static analysis, tests, and optimized web build from this
directory:

```sh
dart format lib/main.dart test/widget_test.dart
flutter analyze
flutter test
flutter build web --release
```

See [`practical-report.md`](practical-report.md) for the layout-widget guide,
responsive behavior, and the verification status for this environment. Follow
[`evidence/viewport-resize-checklist.md`](evidence/viewport-resize-checklist.md)
to demonstrate the dashboard at different viewport sizes.
