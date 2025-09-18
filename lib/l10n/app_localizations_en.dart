// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get szikedAppTitle => 'SZIKED App';

  @override
  String get home => 'Home';

  @override
  String welcomeUserMorning(String user) {
    return 'Good morning, $user!';
  }

  @override
  String welcomeUserAfternoon(String user) {
    return 'Good afternoon, $user!';
  }

  @override
  String welcomeUserEvening(String user) {
    return 'Good evening, $user!';
  }

  @override
  String welcomeUserNight(String user) {
    return 'Good night, $user!';
  }

  @override
  String goToSleepUser(String user) {
    return 'Go to sleep, $user!';
  }

  @override
  String get welcomeSziked => 'Welcome to the SZIKED App!';

  @override
  String get welcomeSzikedSub => 'Choose your login method';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get loginKreta => 'Login with Kréta';

  @override
  String get welcomeBack => 'Welcome back!';

  @override
  String get signIntoAccount => 'Sign in to your account';

  @override
  String get emailOrId => 'Email or KedveskeID';

  @override
  String get password => 'Password';

  @override
  String get backToMain => 'Back to main menu';

  @override
  String get kedveskeId => 'KedveskeID';

  @override
  String get email => 'Email';

  @override
  String get passwordField => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get createAccount => 'Create Account';

  @override
  String get joinSzikedToday => 'Create a SZIKED Account today';

  @override
  String get studentId => 'KedveskeID';

  @override
  String get kretaLoginSuccess => 'Kréta login successful! 🎉';

  @override
  String get logOut => 'Log out';

  @override
  String get profileOptionsDev => 'Profile Options';

  @override
  String get devOptions => 'Developer options';

  @override
  String get themeOptions => 'Theme options';

  @override
  String get switchToDarkTheme => 'Switch to dark theme';

  @override
  String get switchToSystemTheme => 'Switch to system theme';

  @override
  String get switchToLightTheme => 'Switch to light theme';

  @override
  String get switchToAMOLEDTheme => 'Switch to (experimental) AMOLED theme';
}
