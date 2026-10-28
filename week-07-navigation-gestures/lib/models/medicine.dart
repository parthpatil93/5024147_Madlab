import 'package:flutter/material.dart';

@immutable
class Medicine {
  const Medicine({
    required this.name,
    required this.schedule,
    required this.note,
    required this.icon,
    required this.color,
  });

  final String name;
  final String schedule;
  final String note;
  final IconData icon;
  final Color color;

  static const sample = Medicine(
    name: 'Vitamin D',
    schedule: 'Today at 8:00 AM',
    note: 'A sample reminder for this navigation exercise.',
    icon: Icons.wb_sunny_outlined,
    color: Color(0xFFE6A347),
  );

  static const evening = Medicine(
    name: 'Evening reminder',
    schedule: 'Today at 8:00 PM',
    note: 'A second sample item to demonstrate passing route data.',
    icon: Icons.nightlight_outlined,
    color: Color(0xFF6D82A8),
  );
}