# Week 2: Hello World

This directory is an independent Flutter project for Practical 2. Its package
name is `hello_world`; other weekly practicals are not dependencies of this
project.

## Run in GitHub Codespaces

Install and configure the Flutter SDK in the Codespace first, then verify it:

```sh
flutter doctor -v
```

From this directory, fetch packages and start the web app:

```sh
cd week-02-hello-world
flutter pub get
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Open forwarded port 8080 from the Codespaces Ports panel. If Chrome is
available in the development environment, `flutter run -d chrome` is another
option. In VS Code, select a Flutter device and press F5 to debug. The
`debugPrint` messages appear in the Debug Console; the Run and Debug view also
shows exceptions and stack traces. Press the button in the app to print a
second message. Use **Hot Reload** to apply Dart changes while keeping the
current app state.

Run the checks from this directory:

```sh
dart format lib/main.dart test/widget_test.dart
flutter analyze
flutter test
flutter build web --release
```

## Concepts

- `main()` is the Dart program entry point.
- `runApp()` attaches the root widget to Flutter's view and starts building the
	interface.
- `HelloWorldApp` is a `StatelessWidget`: its configuration does not change
	while the app runs.
- `HelloWorldPage` is a `StatefulWidget`, because its button updates a tap
	count and message.
- Widgets form a tree. This practical's tree is
	`HelloWorldApp -> MaterialApp -> HelloWorldPage -> Scaffold -> AppBar / body
	-> Card -> text and button`.

`print()` writes text to standard output. `debugPrint()` is Flutter's
debug-oriented logging helper and is used here for startup and button messages.
Neither replaces reporting errors with useful context; inspect exception
messages and stack traces in the Debug Console when debugging.

The widget test in `test/widget_test.dart` checks the visible title and subtitle
and verifies that tapping the button changes the message. See
[`practical-report.md`](practical-report.md) for the setup and command results
recorded in this environment.