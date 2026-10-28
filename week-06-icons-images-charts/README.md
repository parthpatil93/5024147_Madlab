# Week 6: Icons, Images, and Charts

This directory is an independent Flutter project for Practical 6: a MedMinder
adherence analytics showcase. Its package name is `medminder_analytics`.

## Run in Codespaces

Install Flutter and Dart in the Codespace, then check the environment:

```sh
flutter doctor -v
```

From the repository root, run:

```sh
cd week-06-icons-images-charts
flutter pub get
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Open forwarded port 8080 in the Codespaces Ports panel. If Chrome is available,
`flutter run -d chrome` can be used instead. The local illustration and chart
sample data load without internet access. The online image is not requested
until **Load optional image** is selected; if that image cannot load, a local
fallback is shown.

Run checks from this project directory:

```sh
dart format lib/main.dart test/widget_test.dart
flutter analyze
flutter test
flutter build web --release
```

## Reading the Chart

The chart uses fictional sample percentages for Monday through Sunday. Each
bar represents that day's sample completion percentage, with the vertical
axis running from 0% to 100%. Tap or hover a bar for its exact value. These
figures are demonstration data, not real patient adherence information. See
[`practical-report.md`](practical-report.md) for asset and dependency notes,
and [`evidence/manual-demo-checklist.md`](evidence/manual-demo-checklist.md)
for the manual verification steps.