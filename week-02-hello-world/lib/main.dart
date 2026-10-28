import 'package:flutter/material.dart';

void main() {
  debugPrint('Practical 2: Hello World app started.');
  runApp(const HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00796B)),
        useMaterial3: true,
      ),
      home: const HelloWorldPage(),
    );
  }
}

class HelloWorldPage extends StatefulWidget {
  const HelloWorldPage({super.key});

  @override
  State<HelloWorldPage> createState() => _HelloWorldPageState();
}

class _HelloWorldPageState extends State<HelloWorldPage> {
  int _tapCount = 0;
  String _message = 'Press the button to say hello.';

  void _sayHello() {
    setState(() {
      _tapCount++;
      final unit = _tapCount == 1 ? 'time' : 'times';
      _message = 'You pressed the button $_tapCount $unit.';
    });
    debugPrint('Say hello button tapped $_tapCount time(s).');
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter MAD Laboratory'),
        backgroundColor: colors.surfaceContainer,
      ),
      body: ColoredBox(
        color: colors.surfaceContainerLow,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.waving_hand_rounded,
                          size: 48,
                          color: colors.primary,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Hello World',
                          textAlign: TextAlign.center,
                          style: textTheme.displaySmall?.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Practical 2: Hello World',
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          _message,
                          key: const Key('status-message'),
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        FilledButton.icon(
                          key: const Key('hello-world-button'),
                          onPressed: _sayHello,
                          icon: const Icon(Icons.touch_app_rounded),
                          label: const Text('Say hello'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}