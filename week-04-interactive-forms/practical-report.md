# Practical 4: MedMinder Interactive Forms

## Implementation

This standalone Flutter project demonstrates a local MedMinder profile form.
It uses `MaterialApp` with a Material 3 `ThemeData` and a `Scaffold`. A
`GlobalKey<FormState>` controls a `Form` containing name, email, and masked
password fields. The validators require a non-empty name, a basic valid email
shape, and a password of at least eight characters. A `CheckboxListTile`
collects consent for this local demo.

`submitForm()` validates the form and consent. Invalid submissions show inline
field errors and an error `SnackBar`; valid submissions show a success
`SnackBar`, clear the password field, and update the status text with
`setState()`. The app does not transmit or persist form data. The password is
never copied into submission state.

## Widget Guide

| Widget / API | Purpose | Where it appears |
| --- | --- | --- |
| `MaterialApp` | Applies the app-wide Material 3 theme | Root in `lib/main.dart` |
| `Scaffold` | Provides the page and SnackBar host | Main registration screen |
| `Form` and `GlobalKey<FormState>` | Groups inputs and runs validation | Registration form card |
| `TextFormField` | Collects and validates name, email, and password | Three form rows |
| `CheckboxListTile` | Captures required local-demo consent | Consent row below password |
| `setState()` | Refreshes success copy and consent error state | `_MedMinderFormState` |
| `SnackBar` | Gives submit success or correction feedback | `submitForm()` |
| `TextStyle` / `InputDecoration` | Defines text hierarchy and field presentation | Header and input fields |

## Automated Tests

`test/widget_test.dart` checks required-field and consent errors on an empty
submission, rejects a malformed email and short password, and verifies that a
valid submission displays success feedback and clears the password field.

## Environment and Command Results

At setup time, neither `flutter` nor `dart` was found on `PATH`. Flutter
commands and Dart formatting could not be run in this environment. No success
is claimed for these checks:

| Command | Result |
| --- | --- |
| `flutter pub get` | Not run: Flutter executable unavailable |
| `dart format lib/main.dart test/widget_test.dart` | Not run: Dart executable unavailable |
| `flutter analyze` | Not run: Flutter executable unavailable |
| `flutter test` | Not run: Flutter executable unavailable |
| `flutter build web --release` | Not run: Flutter executable unavailable |

Install Flutter and Dart in the Codespace, verify with `flutter doctor -v`,
then run these commands from `week-04-interactive-forms/`. See `README.md` for
the web-server command and port-forwarding instructions. Use
`evidence/manual-demo-checklist.md` to record a manual demonstration after the
app can be launched.
