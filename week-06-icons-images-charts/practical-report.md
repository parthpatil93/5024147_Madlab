# Practical 6: MedMinder Adherence Analytics

## Screen

The independent `medminder_analytics` Flutter project presents a medication
adherence dashboard. Its Material icons identify the app, medication, and
weekly trend. A bundled illustration and a sample-data bar chart render
offline. The optional network image is requested only after the user selects
its button and has both a loading state and a local error fallback.

## Assets and Packages

`pubspec.yaml` declares `assets/images/medminder_routine.svg` beneath the
Flutter `assets` section. `SvgPicture.asset` from `flutter_svg` renders that
local illustration. It does not need a connection after packages have been
fetched. The separate optional photo uses `Image.network`; its `loadingBuilder`
shows a loading placeholder and `errorBuilder` replaces failures with a local
placeholder. The app does not fetch this image on launch.

`fl_chart` provides the `BarChart` widget. Seven hard-coded fictional values
are plotted from 0% to 100%, with weekday labels and touch tooltips. A taller
bar means a higher sample completion percentage for that day. These figures
are illustrative only and are not patient records or clinical guidance.

## Automated Verification

`test/widget_test.dart` checks the dashboard header and disclaimer, confirms the
local SVG widget and chart are present, checks weekday labels and sample-data
labeling, and verifies that the optional network image is not requested at
startup. The test is included but could not be executed in this environment.

## Runtime Image and Chart Verification

The local SVG and rendered chart have not been runtime-verified because Flutter
and Dart are unavailable. Run `flutter test` to check the SVG asset load and
chart widget, then launch the app and complete the checklist in
`evidence/manual-demo-checklist.md` to visually verify the chart bars and
offline fallback.

## Environment and Command Results

Neither `flutter` nor `dart` was found on `PATH` when this project was set up.
The requested SDK-dependent commands could not be run; none is reported as
passing:

| Command | Result |
| --- | --- |
| `flutter pub get` | Not run: Flutter executable unavailable |
| `dart format lib/main.dart test/widget_test.dart` | Not run: Dart executable unavailable |
| `flutter analyze` | Not run: Flutter executable unavailable |
| `flutter test` | Not run: Flutter executable unavailable |
| `flutter build web --release` | Not run: Flutter executable unavailable |

After installing Flutter and Dart in the Codespace, run `flutter doctor -v`
and then the commands above from `week-06-icons-images-charts/`. Use
`evidence/manual-demo-checklist.md` to record image and chart checks after the
app is launched.
