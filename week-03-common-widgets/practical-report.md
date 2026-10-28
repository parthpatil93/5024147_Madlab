# Practical 3: Common Widgets

## Project

`week-03-common-widgets/` is the independent Flutter project
`medminder_widgets`. The MedMinder screen demonstrates common Material 3 UI
components. It does not import or depend on another weekly project.

## Widget Demonstration

| Widget or API | Purpose | Where it appears |
| --- | --- | --- |
| `MaterialApp` and `ThemeData` | Set the app title, color scheme, typography, and shared input/button styles | `MedMinderApp` in `lib/main.dart` |
| `Column` | Stack related content vertically | Main page, feature tiles, and the reminder form |
| `Row` | Align related content horizontally | Brand header, welcome panel, feature tile headers, and form controls |
| `Container` | Give content a defined size, spacing, and background | Brand mark, welcome icon, feature tiles, and empty-state panel |
| `Padding` and `margin` | Separate content from its edges and neighboring sections | Main page sections and feature tiles |
| `TextStyle` | Apply hierarchy, color, weight, and size to text | Welcome headline, section headings, labels, and feature descriptions |
| `BoxDecoration` | Apply rounded corners, fill colors, and borders | Welcome panel, feature tiles, and reminder form |
| `TextField` | Accept a user-entered reminder label | “Add a reminder” form |
| `ElevatedButton` | Submit the form and provide feedback | “Add reminder” action beside the text field |
| Material icons | Identify app sections and component actions | Brand mark, feature tiles, and submit action |

Submitting text adds it to the on-screen reminder list and displays a
confirmation. Submitting an empty field displays a prompt instead. The input is
demonstration UI only and is not medication advice.

## Verification

The environment check found neither `flutter` nor `dart` on `PATH`, so these
commands could not be executed. This is not a passing test/build result.

| Command | Result |
| --- | --- |
| `flutter create medminder_widgets` | Not run: Flutter executable unavailable; project scaffolded directly |
| `flutter pub get` | Not run: Flutter executable unavailable |
| `dart format lib/main.dart test/widget_test.dart` | Not run: Dart executable unavailable |
| `flutter analyze` | Not run: Flutter executable unavailable |
| `flutter test` | Not run: Flutter executable unavailable |
| `flutter build web --release` | Not run: Flutter executable unavailable |

The widget tests cover initial content, successful reminder submission, and
empty-input feedback. After installing Flutter in Codespaces, run
`flutter doctor -v`, then execute the commands in `README.md` from this project
directory. For browser access, start the web server on `0.0.0.0:8080` and open
the forwarded port in Codespaces.
