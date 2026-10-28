# Week 4: Interactive Forms

This directory is an independent Flutter project for Practical 4: a MedMinder
profile-registration form. The package name is `medminder_forms`; no other
weekly project is required to build or test it.

## Run in Codespaces

Install Flutter and Dart in the Codespace, then verify the setup:

```sh
flutter doctor -v
```

From the repository root, run:

```sh
cd week-04-interactive-forms
flutter pub get
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Open forwarded port 8080 from the Codespaces Ports panel. If Chrome is
available in the environment, `flutter run -d chrome` is an alternative. In
VS Code, choose a Flutter device and press F5 to debug. Set a breakpoint in
`submitForm()` to follow validation and feedback; inspect logs, exceptions, and
stack traces in the Debug Console.

Run project checks from this directory:

```sh
dart format lib/main.dart test/widget_test.dart
flutter analyze
flutter test
flutter build web --release
```

## Form Behavior

The form requires a name, a valid email address, a password of at least eight
characters, and consent to create a local demo profile. The password field is
masked. A valid submission clears the password and shows a success SnackBar;
invalid input highlights field errors and shows an error SnackBar. Nothing is
sent to a server or saved to persistent storage. The form controls hold entered
values only while the screen is active.

See [`practical-report.md`](practical-report.md) for the widget guide and
environment-specific command results. The manual demonstration checklist is
in [`evidence/manual-demo-checklist.md`](evidence/manual-demo-checklist.md).