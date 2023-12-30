import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final Widget monWidgetEnfant;

  const ScaffoldWithNavBar({
    required this.monWidgetEnfant,
    super.key,
  });

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  /// Constructs an [_ScaffoldWithNavBarState].

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.monWidgetEnfant,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _onItemTapped(index, context);
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'A Screen',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'B Screen',
          ),
          NavigationDestination(
            icon: Icon(Icons.notification_important_rounded),
            label: 'C Screen',
          ),
        ],
        selectedIndex: _calculateSelectedIndex(context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/a')) {
      return 0;
    }
    if (location.startsWith('/b')) {
      return 1;
    }
    if (location.startsWith('/c')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/a');
        break;
      case 1:
        GoRouter.of(context).go('/b');
        break;
      case 2:
        GoRouter.of(context).go('/c');
        break;
    }
  }
}