import 'package:flutter/material.dart';
import 'package:medminder_navigation/models/medicine.dart';
import 'package:medminder_navigation/screens/medicine_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSaved = false;
  String _gestureMessage = 'Try a tap, double-tap, or press and hold.';

  void _openDetails(Medicine medicine) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (context) => MedicineDetailScreen(medicine: medicine),
      ),
    );
  }

  void _showRoutineTip() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('A steady routine can make reminders easier to follow.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.medication_rounded, color: colors.primary),
            const SizedBox(width: 8),
            const Text('MedMinder'),
          ],
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Color(0xFFDCEBE4),
              child: Icon(
                Icons.account_circle_outlined,
                color: Color(0xFF087F75),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Good morning',
                    style: textTheme.labelLarge?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your routine, at a glance.',
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF18332F),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4F1EB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline_rounded,
                          color: colors.primary,
                          size: 30,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'A fresh start',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Your sample schedule is ready to explore.',
                                style: textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Today',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        '2 reminders',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _MedicineCard(
                    medicine: Medicine.sample,
                    onTap: () => _openDetails(Medicine.sample),
                  ),
                  const SizedBox(height: 10),
                  _MedicineCard(
                    medicine: Medicine.evening,
                    onTap: () => _openDetails(Medicine.evening),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Routine shortcut',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    key: const Key('gesture-card'),
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        _gestureMessage = 'Routine shortcut tapped.';
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        _isSaved = !_isSaved;
                        _gestureMessage = _isSaved
                            ? 'Routine shortcut saved.'
                            : 'Routine shortcut removed from saved.';
                      });
                    },
                    onLongPress: _showRoutineTip,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFFE1E9E4)),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF1D9),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              Icons.bookmark_rounded,
                              color: _isSaved
                                  ? const Color(0xFFB36B20)
                                  : const Color(0xFF8A6A3F),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Daily routine',
                                  style: textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  _gestureMessage,
                                  key: const Key('gesture-feedback'),
                                  style: textTheme.bodySmall?.copyWith(
                                    color: colors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            _isSaved
                                ? Icons.bookmark_added_rounded
                                : Icons.touch_app_outlined,
                            color: colors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    key: const Key('named-route-button'),
                    onPressed: () => Navigator.pushNamed<void>(
                      context,
                      MedicineDetailScreen.routeName,
                    ),
                    icon: const Icon(Icons.route_outlined),
                    label: const Text('Open details with named route'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MedicineCard extends StatelessWidget {
  const _MedicineCard({required this.medicine, required this.onTap});

  final Medicine medicine;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFE1E9E4)),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: Key('medicine-card-${medicine.name}'),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                    40,
                    medicine.color.red,
                    medicine.color.green,
                    medicine.color.blue,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(medicine.icon, color: medicine.color, size: 25),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      medicine.schedule,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: colors.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}