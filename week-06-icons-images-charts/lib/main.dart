import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MedMinderAnalyticsApp());
}

class MedMinderAnalyticsApp extends StatelessWidget {
  const MedMinderAnalyticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF087F75);

    return MaterialApp(
      title: 'MedMinder | Weekly Overview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7F2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F7F2),
          surfaceTintColor: Colors.transparent,
        ),
      ),
      home: const AnalyticsDashboard(),
    );
  }
}

class AnalyticsDashboard extends StatefulWidget {
  const AnalyticsDashboard({super.key});

  @override
  State<AnalyticsDashboard> createState() => _AnalyticsDashboardState();
}

class _AnalyticsDashboardState extends State<AnalyticsDashboard> {
  bool _showNetworkImage = false;

  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const _sampleValues = [82.0, 94.0, 71.0, 100.0, 88.0, 76.0, 93.0];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            Icon(Icons.medication_rounded, color: colors.primary, size: 25),
            const SizedBox(width: 9),
            Text(
              'MedMinder',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colors.tertiaryContainer,
              child: Icon(
                Icons.person_outline_rounded,
                size: 20,
                color: colors.onTertiaryContainer,
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
              constraints: const BoxConstraints(maxWidth: 820),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your week, in focus',
                              style: textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF18332F),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'A simple look at a steady routine.',
                              style: textTheme.bodyLarge?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.auto_graph_rounded,
                        size: 34,
                        color: colors.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  _IllustrationCard(colors: colors, textTheme: textTheme),
                  const SizedBox(height: 18),
                  _ChartCard(
                    colors: colors,
                    textTheme: textTheme,
                    days: _days,
                    values: _sampleValues,
                  ),
                  const SizedBox(height: 18),
                  _OptionalImageCard(
                    colors: colors,
                    textTheme: textTheme,
                    isVisible: _showNetworkImage,
                    onToggle: () {
                      setState(() {
                        _showNetworkImage = !_showNetworkImage;
                      });
                    },
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Sample figures for this practical only. Not real patient data.',
                    key: const Key('sample-data-disclaimer'),
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
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

class _IllustrationCard extends StatelessWidget {
  const _IllustrationCard({required this.colors, required this.textTheme});

  final ColorScheme colors;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE6F2ED),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.favorite_rounded, size: 22, color: colors.primary),
                const SizedBox(height: 12),
                Text(
                  'Small steps add up.',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF18332F),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Keep your routine close and your progress in view.',
                  style: textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF42625B),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SvgPicture.asset(
            'assets/images/medminder_routine.svg',
            key: const Key('local-illustration'),
            semanticsLabel: 'Illustration of a weekly medication routine',
            width: 136,
            height: 116,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  const _ChartCard({
    required this.colors,
    required this.textTheme,
    required this.days,
    required this.values,
  });

  final ColorScheme colors;
  final TextTheme textTheme;
  final List<String> days;
  final List<double> values;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFE1E9E4)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.bar_chart_rounded, color: colors.primary, size: 23),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    'Weekly adherence',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1D9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Text(
                      'SAMPLE',
                      style: textTheme.labelSmall?.copyWith(
                        color: const Color(0xFF805414),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Illustrative doses completed by day',
              style: textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: BarChart(
                BarChartData(
                  minY: 0,
                  maxY: 100,
                  alignment: BarChartAlignment.spaceAround,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 25,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: const Color(0xFFE8EEEA),
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final day = days[group.x];
                        return BarTooltipItem(
                          '$day\n${rod.toY.toInt()}%',
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 38,
                        interval: 25,
                        getTitlesWidget: (value, meta) => SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 8,
                          child: Text(
                            '${value.toInt()}%',
                            style: const TextStyle(
                              color: Color(0xFF71817B),
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= days.length) {
                            return const SizedBox.shrink();
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 8,
                            child: Text(
                              days[index],
                              style: const TextStyle(
                                color: Color(0xFF52625D),
                                fontSize: 11,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: List.generate(
                    values.length,
                    (index) => BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: values[index],
                          width: 19,
                          color: index == 3
                              ? const Color(0xFFE69A55)
                              : colors.primary,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Higher bars indicate a higher sample completion percentage.',
              style: textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionalImageCard extends StatelessWidget {
  const _OptionalImageCard({
    required this.colors,
    required this.textTheme,
    required this.isVisible,
    required this.onToggle,
  });

  final ColorScheme colors;
  final TextTheme textTheme;
  final bool isVisible;
  final VoidCallback onToggle;

  static const _imageUrl =
      'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae'
      '?auto=format&fit=crop&w=960&q=80';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFE1E9E4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.image_outlined, color: colors.primary),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    'Optional online image',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextButton.icon(
                  key: const Key('network-image-toggle'),
                  onPressed: onToggle,
                  icon: Icon(
                    isVisible ? Icons.close_rounded : Icons.download_rounded,
                  ),
                  label: Text(isVisible ? 'Hide' : 'Load optional image'),
                ),
              ],
            ),
            if (isVisible) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  _imageUrl,
                  key: const Key('network-image'),
                  height: 168,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const _NetworkImageFallback(
                      label: 'Loading optional image…',
                      icon: Icons.downloading_rounded,
                    );
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const _NetworkImageFallback(
                        label: 'Image unavailable. Your dashboard works offline.',
                        icon: Icons.cloud_off_rounded,
                      ),
                ),
              ),
            ] else ...[
              const SizedBox(height: 4),
              Text(
                'Loads only when requested. The dashboard uses its local '
                'illustration when offline.',
                style: textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _NetworkImageFallback extends StatelessWidget {
  const _NetworkImageFallback({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      width: double.infinity,
      color: const Color(0xFFEAF1ED),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: const Color(0xFF55746A)),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(label, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}