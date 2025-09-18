import 'package:flutter/material.dart';
import 'package:sziked/helpers/l10n.dart';  
import 'package:sziked/helpers/supabase/login_service.dart';
import '../login/login_main.dart';
import 'package:sziked/widgets/custom_appbar.dart';
import 'package:sziked/helpers/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class DeveloperPage extends StatefulWidget {
  const DeveloperPage({super.key});

  @override
  State<DeveloperPage> createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: l10n.devOptions),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                l10n.themeOptions,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(l10n.switchToDarkTheme),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false).setDarkMode();
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(l10n.switchToLightTheme),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false).setLightMode();
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(l10n.switchToSystemTheme),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false).setSystemMode();
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(l10n.switchToAMOLEDTheme),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false).setAmoledMode(true);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.profileOptionsDev,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(l10n.logOut),
                  onPressed: () {
                    LoginService.logout();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginMain()), (Route<dynamic> route) => false);
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        )
      )
    );
  }
}