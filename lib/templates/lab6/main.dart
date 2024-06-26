import 'package:education/templates/lab6/login.dart';
import 'package:education/templates/lab6/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(ThemeData.light()),
      child: MyApp(),
    ),
  );
}

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme;
  ThemeNotifier(this._currentTheme);
  ThemeData get currentTheme => _currentTheme;
  void setTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) {
        return MaterialApp(
          theme: theme.currentTheme,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            //AppLocalizations.delegate,
            // Add your generated delegate here
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('ru', ''),
          ],
          home: LoginScreen(),
        );
      },
    );
  }
}

