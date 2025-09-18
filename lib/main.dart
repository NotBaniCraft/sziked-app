import 'package:flutter/material.dart';
import 'widgets/bottom_nav_bar_widget.dart';
import 'pages/login/login_main.dart';
import 'l10n/app_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sziked/helpers/supabase/login_service.dart';
import 'package:provider/provider.dart';
import 'package:sziked/helpers/themes/theme_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANONKEY']!,
  );
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'SZIKED',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: AuthWrapper(),
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            iconTheme: IconThemeData(
              color: Colors.blue
            )
          ),
          darkTheme: themeProvider.getDarkTheme(),  // Use dynamic dark theme
          themeMode: themeProvider.themeMode,  // Fixed: Use provider's themeMode
        );
      }
    );
  }
}

// Wrapper to handle authentication state
class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool? loggedIn; // null = loading, true/false = determined
  
  @override
  void initState() {
    super.initState();
    checkAuthStatus();
  }
  
  void checkAuthStatus() {
    // Check authentication status using your LoginService
    bool isAuthenticated = LoginService.isLoggedIn();
    setState(() {
      loggedIn = isAuthenticated;
    });
  }
  
  // Method to update auth status from other parts of the app
  void updateAuthStatus() {
    checkAuthStatus();
  }
  
  @override
  Widget build(BuildContext context) {
    // Show loading while determining auth status
    if (loggedIn == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    // Show appropriate screen based on auth status
    return loggedIn! ? BottomNavBarWidget() : LoginMain();
  }
}