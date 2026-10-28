# Practical 7: MedMinder Navigation and Gestures

## Navigation

`MaterialApp.routes` registers `/` for `HomeScreen` and
`MedicineDetailScreen.routeName` for the named details destination. Tapping a
medicine card uses `Navigator.push()` with a `MaterialPageRoute` and passes
that card's medicine. The dashboard's named-route button uses
`Navigator.pushNamed()`. The details screen's back button explicitly calls
`Navigator.pop()` to return to the previous screen.

## Gestures

A `GestureDetector` wraps the daily-routine tile on the dashboard:

- `onTap` updates the tile's feedback text.
- `onDoubleTap` toggles its saved state and changes the bookmark icon.
- `onLongPress` displays a SnackBar with routine guidance.

The screen also remains scrollable and its navigation controls use standard
Material buttons. The demonstration checklist covers each action on mouse and
touchscreen.

## Project Structure

- `lib/main.dart`: Material app theme and named route table.
- `lib/models/medicine.dart`: small immutable display model and sample data.
- `lib/screens/home_screen.dart`: dashboard, direct route push, named route
	action, and gesture tile.
- `lib/screens/medicine_detail_screen.dart`: details content and explicit pop.
- `test/widget_test.dart`: direct and named navigation plus gesture tests.
- `evidence/manual-demo-checklist.md`: manual demonstration steps.

## Environment and Command Results

The environment check found neither `flutter` nor `dart` on `PATH`. Flutter
project commands and Dart formatting could not be run, so no passing SDK check
is claimed:

| Command | Result |
| --- | --- |
| `flutter pub get` | Not run: Flutter executable unavailable |
| `dart format ...` | Not run: Dart executable unavailable |
| `flutter analyze` | Not run: Flutter executable unavailable |
| `flutter test` | Not run: Flutter executable unavailable |
| `flutter build web --release` | Not run: Flutter executable unavailable |

Install Flutter and Dart in the Codespace, run `flutter doctor -v`, and run
these commands from `week-07-navigation-gestures/`. See `README.md` for the
Codespaces web-server launch command and port-forwarding instructions.
