import 'package:flutter/material.dart';
import 'package:sziked/helpers/l10n.dart';

class WelcomeWidget extends StatefulWidget {
  final String user;
  
  const WelcomeWidget({super.key, required this.user});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  late String timeOfDay;
  late IconData timeIcon;
  late bool shouldGoToSleep;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final hour = now.hour;
    final weekday = now.weekday; // 1=Monday, 7=Sunday
    
    // Weekend late hours (show normal night greeting):
    // - Friday after 22:00
    // - Saturday after 22:00 OR before 5:00 
    // - Sunday before 5:00
    bool isWeekendLateHours = (weekday == 5 && hour >= 22) ||          // Friday night
                              (weekday == 6 && (hour >= 22 || hour < 5)) || // Saturday night/early Sunday
                              (weekday == 7 && hour < 5);              // Sunday early morning
    
    // Show sleep message if it's late hours (22:00-5:00) but NOT weekend late hours
    bool isLateHours = (hour >= 22 || hour < 5);
    shouldGoToSleep = isLateHours && !isWeekendLateHours;
    
    if (hour >= 5 && hour < 12) {
      //morning
      timeOfDay = "morning";
      timeIcon = Icons.sunny;
    } else if (hour >= 12 && hour < 18) {
      //afternoon
      timeOfDay = "afternoon";
      timeIcon = Icons.wb_sunny;
    } else if (hour >= 18 && hour < 22) {
      //evening
      timeOfDay = "evening";
      timeIcon = Icons.wb_twilight;
    } else {
      //night
      timeOfDay = "night";
      timeIcon = Icons.nightlight_round;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          timeIcon,
          size: 20,
        ),
        SizedBox(height: 8),
        Text(
          shouldGoToSleep ? l10n.goToSleepUser(widget.user) : _getGreeting(),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
          )
        ),
      ],
    );
  }

  String _getGreeting() {
    switch (timeOfDay) {
      case "morning":
        return l10n.welcomeUserMorning(widget.user);
      case "afternoon":
        return l10n.welcomeUserAfternoon(widget.user);
      case "evening":
        return l10n.welcomeUserEvening(widget.user);
      default:
        return l10n.welcomeUserNight(widget.user);
    }
  }
}