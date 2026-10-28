import 'package:flutter/material.dart';

void main() {
  runApp(const MedMinderApp());
}

class MedMinderApp extends StatelessWidget {
  const MedMinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF087F75);

    return MaterialApp(
      title: 'MedMinder Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: teal,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F8F6),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Color(0xFF18332F),
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          titleLarge: TextStyle(
            color: Color(0xFF18332F),
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            color: Color(0xFF18332F),
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF687A76),
            fontSize: 14,
          ),
        ),
      ),
      home: const MedMinderDashboard(),
    );
  }
}

class MedMinderDashboard extends StatelessWidget {
  const MedMinderDashboard({super.key});

  static const _ink = Color(0xFF18332F);
  static const _muted = Color(0xFF687A76);
  static const _teal = Color(0xFF087F75);
  static const _line = Color(0xFFE2EBE7);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, viewport) {
            final horizontalPadding = viewport.maxWidth < 400 ? 16.0 : 28.0;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                24,
                horizontalPadding,
                36,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(theme),
                      const SizedBox(height: 28),
                      _buildTodaySummary(theme),
                      const SizedBox(height: 28),
                      _buildQuickActions(context, theme),
                      const SizedBox(height: 30),
                      _buildSectionHeading(
                        theme,
                        title: "Today's schedule",
                        trailing: 'See calendar',
                      ),
                      const SizedBox(height: 14),
                      LayoutBuilder(
                        builder: (context, contentSize) {
                          if (contentSize.maxWidth >= 760) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: _buildSchedule(theme),
                                ),
                                const SizedBox(width: 20),
                                Flexible(
                                  flex: 4,
                                  child: _buildAdherence(theme),
                                ),
                              ],
                            );
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _buildSchedule(theme),
                              const SizedBox(height: 20),
                              _buildAdherence(theme),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.favorite_rounded, color: _teal, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    'MedMinder',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: _teal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Text('Good morning, Sarah', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 6),
              Text(
                'Wednesday, October 28',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFFDCEFEB),
            shape: BoxShape.circle,
          ),
          child: Text(
            'S',
            style: theme.textTheme.titleMedium?.copyWith(
              color: _teal,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTodaySummary(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: _teal,
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFF087F75), Color(0xFF12685F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A087F75),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 360;
          final progress = _todayProgress(theme, compact: compact);
          final details = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TODAY'S MEDICATION",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.white.withOpacity(0.78),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'You’re doing great!',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontSize: compact ? 17 : 20,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '2 of 3 doses taken today',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.86),
                ),
              ),
            ],
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                progress,
                const SizedBox(height: 16),
                details,
              ],
            );
          }

          return Row(
            children: [
              progress,
              const SizedBox(width: 18),
              Expanded(child: details),
              const SizedBox(width: 8),
              const Icon(
                Icons.auto_awesome_rounded,
                color: Color(0x99FFFFFF),
                size: 28,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _todayProgress(ThemeData theme, {required bool compact}) {
    return SizedBox(
      width: compact ? 70 : 76,
      height: compact ? 70 : 76,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: 2 / 3,
              strokeWidth: 6,
              backgroundColor: Colors.white.withOpacity(0.22),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          Text(
            '67%',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context, ThemeData theme) {
    const actions = [
      _QuickActionData(Icons.add_alarm_rounded, 'Reminder'),
      _QuickActionData(Icons.medication_outlined, 'Medicine'),
      _QuickActionData(Icons.water_drop_outlined, 'Hydration'),
      _QuickActionData(Icons.bar_chart_rounded, 'Report'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeading(theme, title: 'Quick actions'),
        const SizedBox(height: 14),
        Row(
          children: [
            for (var index = 0; index < actions.length; index++) ...[
              if (index > 0) const SizedBox(width: 8),
              Expanded(
                child: _buildQuickAction(context, theme, actions[index]),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildQuickAction(
    BuildContext context,
    ThemeData theme,
    _QuickActionData action,
  ) {
    return OutlinedButton(
      onPressed: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${action.label} selected')));
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: _teal,
        backgroundColor: Colors.white,
        side: const BorderSide(color: _line),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(action.icon, size: 21),
          const SizedBox(height: 5),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              action.label,
              maxLines: 1,
              style: theme.textTheme.labelSmall?.copyWith(
                color: _ink,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeading(
    ThemeData theme, {
    required String title,
    String? trailing,
  }) {
    return Row(
      children: [
        Expanded(child: Text(title, style: theme.textTheme.titleLarge)),
        if (trailing != null)
          Text(
            trailing,
            style: theme.textTheme.labelLarge?.copyWith(
              color: _teal,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }

  Widget _buildSchedule(ThemeData theme) {
    const doses = [
      _DoseData(
        time: '8:00 AM',
        name: 'Vitamin D3',
        detail: '1 tablet · with breakfast',
        icon: Icons.wb_sunny_outlined,
        color: Color(0xFFFFF1D6),
        status: 'Taken',
        taken: true,
      ),
      _DoseData(
        time: '1:00 PM',
        name: 'Omega-3',
        detail: '2 softgels · after lunch',
        icon: Icons.restaurant_outlined,
        color: Color(0xFFE6F2EE),
        status: 'Taken',
        taken: true,
      ),
      _DoseData(
        time: '8:00 PM',
        name: 'Magnesium',
        detail: '1 capsule · before bed',
        icon: Icons.nightlight_outlined,
        color: Color(0xFFECE9FA),
        status: 'Upcoming',
        taken: false,
      ),
    ];

    return Column(
      children: [
        for (var index = 0; index < doses.length; index++) ...[
          if (index > 0) const SizedBox(height: 12),
          _buildDoseCard(theme, doses[index]),
        ],
      ],
    );
  }

  Widget _buildDoseCard(ThemeData theme, _DoseData dose) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _line),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: dose.color,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(dose.icon, color: _ink, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dose.time, style: theme.textTheme.labelMedium),
                const SizedBox(height: 3),
                Text(
                  dose.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 3),
                Text(
                  dose.detail,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(color: _muted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _statusBadge(theme, dose.status, taken: dose.taken),
        ],
      ),
    );
  }

  Widget _statusBadge(
    ThemeData theme,
    String status, {
    required bool taken,
  }) {
    final color = taken ? _teal : const Color(0xFF9A6B18);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: taken ? const Color(0xFFE6F4EF) : const Color(0xFFFFF3DC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildAdherence(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Weekly adherence',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const Icon(Icons.more_horiz_rounded, color: _muted),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'You’re building a healthy habit.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '92%',
                style: theme.textTheme.headlineSmall?.copyWith(fontSize: 32),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '+4% this week',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: _teal,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const _WeeklyBars(),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _DayLabel('M'),
              _DayLabel('T'),
              _DayLabel('W'),
              _DayLabel('T'),
              _DayLabel('F'),
              _DayLabel('S'),
              _DayLabel('S'),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeeklyBars extends StatelessWidget {
  const _WeeklyBars();

  static const _values = [0.78, 0.92, 0.7, 0.95, 0.86, 0.62, 0.72];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var index = 0; index < _values.length; index++) ...[
            if (index > 0) const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 70 * _values[index],
                decoration: BoxDecoration(
                  color: index == 4
                      ? const Color(0xFF087F75)
                      : const Color(0xFFDCEFEB),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DayLabel extends StatelessWidget {
  const _DayLabel(this.day);

  final String day;

  @override
  Widget build(BuildContext context) {
    return Text(
      day,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: const Color(0xFF899994),
          ),
    );
  }
}

class _QuickActionData {
  const _QuickActionData(this.icon, this.label);

  final IconData icon;
  final String label;
}

class _DoseData {
  const _DoseData({
    required this.time,
    required this.name,
    required this.detail,
    required this.icon,
    required this.color,
    required this.status,
    required this.taken,
  });

  final String time;
  final String name;
  final String detail;
  final IconData icon;
  final Color color;
  final String status;
  final bool taken;
}
