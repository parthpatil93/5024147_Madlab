# Viewport Resize Demonstration Checklist

Run the app from `week-05-layout-widgets/` with:

```sh
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Open the forwarded port and use browser developer tools' responsive device
toolbar. Check the following:

- [ ] At 1280 × 900, the dashboard is centered and the schedule and adherence
  panel are side by side.
- [ ] At 390 × 844, sections stack as needed without horizontal scrolling.
- [ ] At 320 × 720, quick-action labels remain inside the buttons and schedule
  text truncates without crossing the card boundaries.
- [ ] The lower dashboard remains reachable by vertical scrolling.
- [ ] A quick action displays its local feedback message.
- [ ] Save a wide screenshot as `dashboard-wide.png` and a narrow screenshot as
  `dashboard-narrow.png` in this directory after the app has been run.

Screenshots are intentionally left for an actual app run; none are represented
as captured evidence before Flutter is available.
