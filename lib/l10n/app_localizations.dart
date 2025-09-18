import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hu'),
  ];

  /// The title of the SZIKED application
  ///
  /// In en, this message translates to:
  /// **'SZIKED App'**
  String get szikedAppTitle;

  /// The title of the Homepage
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// A welcome message shown at homepage during morning hours (05:00-11:59)
  ///
  /// In en, this message translates to:
  /// **'Good morning, {user}!'**
  String welcomeUserMorning(String user);

  /// A welcome message shown at homepage during afternoon hours (12:00-17:59)
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, {user}!'**
  String welcomeUserAfternoon(String user);

  /// A welcome message shown at homepage during evening hours (18:00-21:59)
  ///
  /// In en, this message translates to:
  /// **'Good evening, {user}!'**
  String welcomeUserEvening(String user);

  /// A welcome message shown at homepage during night hours (22:00-04:59) on Fri-Sun
  ///
  /// In en, this message translates to:
  /// **'Good night, {user}!'**
  String welcomeUserNight(String user);

  /// A welcome message shown at homepage during night hours (22:00-04:59) on Sun-Thu
  ///
  /// In en, this message translates to:
  /// **'Go to sleep, {user}!'**
  String goToSleepUser(String user);

  /// Main welcome message
  ///
  /// In en, this message translates to:
  /// **'Welcome to the SZIKED App!'**
  String get welcomeSziked;

  /// Subtitle for login method selection
  ///
  /// In en, this message translates to:
  /// **'Choose your login method'**
  String get welcomeSzikedSub;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Kréta login button text
  ///
  /// In en, this message translates to:
  /// **'Login with Kréta'**
  String get loginKreta;

  /// Welcome message on login page
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeBack;

  /// Subtitle on login page
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account'**
  String get signIntoAccount;

  /// Label for email or ID input field
  ///
  /// In en, this message translates to:
  /// **'Email or KedveskeID'**
  String get emailOrId;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Back button text
  ///
  /// In en, this message translates to:
  /// **'Back to main menu'**
  String get backToMain;

  /// Label for KedveskeID input field
  ///
  /// In en, this message translates to:
  /// **'KedveskeID'**
  String get kedveskeId;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordField;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Title on register page
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Subtitle on register page
  ///
  /// In en, this message translates to:
  /// **'Create a SZIKED Account today'**
  String get joinSzikedToday;

  /// KedveskeID input field
  ///
  /// In en, this message translates to:
  /// **'KedveskeID'**
  String get studentId;

  /// Success message after Kréta login
  ///
  /// In en, this message translates to:
  /// **'Kréta login successful! 🎉'**
  String get kretaLoginSuccess;

  /// String used for loging out
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// String used for profile options
  ///
  /// In en, this message translates to:
  /// **'Profile Options'**
  String get profileOptionsDev;

  /// String used for developer options title
  ///
  /// In en, this message translates to:
  /// **'Developer options'**
  String get devOptions;

  /// String used for theme options
  ///
  /// In en, this message translates to:
  /// **'Theme options'**
  String get themeOptions;

  /// String used for switching to dark theme
  ///
  /// In en, this message translates to:
  /// **'Switch to dark theme'**
  String get switchToDarkTheme;

  /// String used for switching to system theme
  ///
  /// In en, this message translates to:
  /// **'Switch to system theme'**
  String get switchToSystemTheme;

  /// String used for switching to light theme
  ///
  /// In en, this message translates to:
  /// **'Switch to light theme'**
  String get switchToLightTheme;

  /// String used for switching to (experimental) AMOLED theme
  ///
  /// In en, this message translates to:
  /// **'Switch to (experimental) AMOLED theme'**
  String get switchToAMOLEDTheme;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hu':
      return AppLocalizationsHu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
