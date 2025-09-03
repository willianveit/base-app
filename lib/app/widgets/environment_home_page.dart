import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnvironmentHomePage extends StatefulWidget {
  const EnvironmentHomePage({
    super.key,
    required this.title,
    required this.environment,
    required this.primaryColor,
  });

  final String title;
  final String environment;
  final Color primaryColor;

  @override
  State<EnvironmentHomePage> createState() => _EnvironmentHomePageState();
}

class _EnvironmentHomePageState extends State<EnvironmentHomePage> {
  int _counter = 0;
  String _bundleId = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getBundleId();
  }

  Future<void> _getBundleId() async {
    try {
      const platform = MethodChannel('flutter.native/helper');
      final String bundleId = await platform.invokeMethod('getBundleId');
      setState(() {
        _bundleId = bundleId;
      });
    } catch (e) {
      setState(() {
        _bundleId = 'Error: $e';
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Color get _environmentColor {
    switch (widget.environment.toLowerCase()) {
      case 'dev':
      case 'development':
        return Colors.green;
      case 'hmg':
      case 'homologation':
        return Colors.orange;
      case 'prod':
      case 'production':
        return Colors.deepPurple;
      default:
        return widget.primaryColor;
    }
  }

  String get _environmentLabel {
    switch (widget.environment.toLowerCase()) {
      case 'dev':
      case 'development':
        return 'DEVELOPMENT ENVIRONMENT';
      case 'hmg':
      case 'homologation':
        return 'HOMOLOGATION ENVIRONMENT';
      case 'prod':
      case 'production':
        return 'PRODUCTION ENVIRONMENT';
      default:
        return widget.environment.toUpperCase();
    }
  }

  IconData get _environmentIcon {
    switch (widget.environment.toLowerCase()) {
      case 'dev':
      case 'development':
        return Icons.code;
      case 'hmg':
      case 'homologation':
        return Icons.science;
      case 'prod':
      case 'production':
        return Icons.rocket_launch;
      default:
        return Icons.apps;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isProduction =
        widget.environment.toLowerCase() == 'prod' ||
        widget.environment.toLowerCase() == 'production';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 32),
                // Bundle ID Display
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                    color: _environmentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _environmentColor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: _environmentColor,
                        size: 24,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Bundle ID:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SelectableText(
                        _bundleId,
                        style: TextStyle(
                          fontSize: 12,
                          color: _environmentColor,
                          fontFamily: 'monospace',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Environment: ${widget.environment.toUpperCase()}',
                        style: TextStyle(
                          fontSize: 12,
                          color: _environmentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Environment Banner (não mostrar em produção)
          if (!isProduction)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: _environmentColor.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(_environmentIcon, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        _environmentLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Environment Badge (Corner)
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: _environmentColor.withOpacity(isProduction ? 0.8 : 1.0),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white,
                  width: isProduction ? 1 : 2,
                ),
              ),
              child: Text(
                widget.environment.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isProduction ? 10 : 12,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: _environmentColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
