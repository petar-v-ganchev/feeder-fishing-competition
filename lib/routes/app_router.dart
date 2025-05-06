import 'package:flutter/material.dart';

import '../screens/welcome/welcome_screen.dart';
import '../screens/lobby/lobby_screen.dart';
import '../screens/setup/setup_screen.dart';
import '../screens/competition/competition_screen.dart';
import '../screens/results/results_screen.dart';

class AppRouter {
  // Route names
  static const String welcomeRoute = '/';
  static const String lobbyRoute = '/lobby';
  static const String setupRoute = '/setup';
  static const String competitionRoute = '/competition';
  static const String resultsRoute = '/results';

  // Route generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      
      case lobbyRoute:
        return MaterialPageRoute(builder: (_) => const LobbyScreen());
      
      case setupRoute:
        return MaterialPageRoute(builder: (_) => const SetupScreen());
      
      case competitionRoute:
        return MaterialPageRoute(builder: (_) => const CompetitionScreen());
      
      case resultsRoute:
        return MaterialPageRoute(builder: (_) => const ResultsScreen());
      
      default:
        // If there is no such named route, return error route
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route ${settings.name} not found'),
            ),
          ),
        );
    }
  }
}