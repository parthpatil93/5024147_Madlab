# Practical 2: Hello World

## Project

This folder is an independent Flutter project named `hello_world`. The Flutter
SDK was not available in the setup environment, so `flutter create hello_world`
could not be run. A minimal conventional Flutter project structure was created
instead, with the application in `lib/main.dart` and its widget test in
`test/widget_test.dart`.

## Flutter Concepts

- `main()` is the Dart entry point. It logs a startup message and calls
	`runApp(const HelloWorldApp())`.
- `runApp()` installs the root widget and causes Flutter to build its widget
	tree.
- `HelloWorldApp` extends `StatelessWidget` because its configuration is
	constant and it does not own changing data.
- `HelloWorldPage` is a `StatefulWidget`; its state stores the button tap count
	and message. `setState()` updates that state and asks Flutter to rebuild the
	affected interface.
- Widget tree: `HelloWorldApp -> MaterialApp -> HelloWorldPage -> Scaffold ->
	AppBar / body -> Card -> title, subtitle, message, button`.

## Debugging Notes

`debugPrint()` writes the startup line `Practical 2: Hello World app started.`
and a line such as `Say hello button tapped 1 time(s).` after the button is
pressed. View these messages in the VS Code Debug Console while running under
the debugger. `print()` also writes to standard output; `debugPrint()` is a
Flutter logging helper. When an exception occurs, inspect its message and stack
trace in the Debug Console rather than relying only on log statements.

## Environment and Command Results

The environment check found neither `flutter` nor `dart` on `PATH`. As a
result, project generation and Flutter/Dart validation could not be executed:

| Command | Result |
| --- | --- |
| `flutter create hello_world` | Not run: Flutter executable unavailable |
| `flutter pub get` | Not run: Flutter executable unavailable |
| `dart format lib/main.dart test/widget_test.dart` | Not run: Dart executable unavailable |
| `flutter analyze` | Not run: Flutter executable unavailable |
| `flutter test` | Not run: Flutter executable unavailable |
| `flutter build web --release` | Not run: Flutter executable unavailable |

These are not passing results. Install Flutter and Dart in the Codespace, run
`flutter doctor -v`, then execute the commands above from
`week-02-hello-world/`. For a web session, use
`flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080` and open
forwarded port 8080 in Codespaces. See `README.md` for the full run and debug
instructions.
