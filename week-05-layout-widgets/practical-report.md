# Practical 5: MedMinder Layout Widgets

## Aim and implementation

The practical demonstrates how Flutter layout widgets can form a responsive
screen. The standalone app is a MedMinder dashboard with a greeting/header,
today's medication summary, a row of quick-action buttons, three medication
schedule cards, and a weekly adherence summary. The sample is local and
contains no medication-management or persistence backend.

## Layout widget guide

| Widget | Why it is used |
| --- | --- |
| `Scaffold` | Supplies the page structure and a `ScaffoldMessenger` host for quick-action feedback. |
| `SafeArea` | Keeps the screen clear of system status and navigation areas. |
| `SingleChildScrollView` | Lets the complete dashboard scroll vertically on short or narrow viewports. |
| `Center` | Centers the dashboard content within the available viewport. |
| `ConstrainedBox` | Caps the content at 1120 logical pixels so it stays readable on wide screens. |
| `Column` | Stacks the header, summary, actions, and dashboard sections vertically. |
| `Row` | Places the header/avatar, summary content, weekly bars, and quick actions side by side. |
| `Expanded` | Shares available width across the header, action buttons, and the wide-screen schedule/adherence columns. |
| `Flexible` | Allows the wide-screen adherence panel to occupy a proportional share without forcing a fixed width. |
| `Container` | Provides card surfaces, status badges, avatar color, and the decorated summary panel. |
| `Padding` | Gives the adherence card's day labels and percentage label explicit spacing. |
| `SizedBox` | Creates predictable spacing and fixed-size progress/icon regions. |
| `LayoutBuilder` | Chooses compact summary behavior and switches the lower content between a column and a two-column layout. |
| `BoxDecoration` | Applies rounded corners, borders, a gradient, and a soft shadow to dashboard surfaces. |
| `TextStyle` | Establishes the app's typography hierarchy, color, weight, and tracking. |
| `Colors` | Supplies Material colors and custom palette values for text, surfaces, icons, and progress indicators. |

Quick actions are `OutlinedButton`s with icons and labels. Selecting one shows
a local `SnackBar`; it does not change or save medication data.

## Responsive behavior

The content is centered and capped at 1120 logical pixels. On narrow screens
the page uses 16-pixel horizontal insets, the medication summary stacks its
progress indicator and copy, and the schedule and adherence sections stack.
At 760 logical pixels of content width, those last sections become a
proportional `Row` with `Expanded` and `Flexible`. The four quick actions stay
in a `Row`; each receives equal width and its label scales down to avoid
overflow. Schedule details truncate safely when their available width is
small. The page scrolls vertically instead of compressing content to fit the
viewport height.

## Automated coverage

`test/widget_test.dart` checks the dashboard sections and schedule at a desktop
viewport, verifies the quick-action row and vertical scroll behavior at a
320-pixel phone viewport, checks that the adherence section remains reachable,
and verifies that a quick action displays feedback. Each viewport test checks
for uncaught Flutter rendering exceptions.

## Viewport-resize demonstration

1. Start the app using the web-server command in `README.md` and open the
   forwarded port in a desktop browser.
2. Open browser developer tools and enable responsive/device emulation.
3. Resize to **1280 × 900**. Confirm that the schedule and adherence panel
   appear side by side and the content remains centered.
4. Resize to **390 × 844**, then **320 × 720**. Confirm that schedule and
   adherence stack, quick-action labels remain inside their buttons, and no
   horizontal scrollbar or clipped card appears.
5. At the narrow size, scroll vertically to the adherence panel and tap a
   quick action to check its feedback.
6. Capture screenshots at the desktop and narrow sizes in this `evidence/`
   directory. Suggested names: `dashboard-wide.png` and
   `dashboard-narrow.png`. The screenshots should be captured after running
   the app; they are not fabricated or included as unverified artifacts.

The manual steps are also recorded in
[`evidence/viewport-resize-checklist.md`](evidence/viewport-resize-checklist.md).

## Environment and command results

At implementation time, neither `flutter` nor `dart` was available on
`PATH`. Source, tests, and web project files are present, but Flutter commands
could not be executed in this environment. No success is claimed for these
checks:

| Command | Result |
| --- | --- |
| `dart format lib/main.dart test/widget_test.dart` | Not run: Dart executable unavailable |
| `flutter analyze` | Not run: Flutter executable unavailable |
| `flutter test` | Not run: Flutter executable unavailable |
| `flutter build web --release` | Not run: Flutter executable unavailable |

Install Flutter, verify it with `flutter doctor -v`, and run the commands from
this project's directory to complete validation.