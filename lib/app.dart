import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/colors.dart';
import 'providers/locale_provider.dart';
import 'routes/app_router.dart';
import 'services/firebase/analytics_service.dart';
import 'services/localization/app_localizations.dart';

class FeederFishingApp extends StatelessWidget {
  const FeederFishingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    
    return MaterialApp(
      title: 'Feeder Fishing Competition',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'GameFont',
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          color: AppColors.primary,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: AppColors.textPrimary),
          headlineMedium: TextStyle(color: AppColors.textPrimary),
          titleLarge: TextStyle(color: AppColors.textPrimary),
          bodyLarge: TextStyle(color: AppColors.textSecondary),
          bodyMedium: TextStyle(color: AppColors.textSecondary),
        ),
      ),
      
      // Localization setup
      locale: localeProvider.locale,
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
        Locale('fr', ''), // French
        Locale('de', ''), // German
        Locale('ru', ''), // Russian
        Locale('zh', ''), // Chinese
        Locale('ja', ''), // Japanese
        Locale('bg', ''), // Bulgarian
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      
      // Firebase Analytics observer
      navigatorObservers: [
        AnalyticsService.observer,
      ],
      
      // App routes
      initialRoute: AppRouter.welcomeRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}