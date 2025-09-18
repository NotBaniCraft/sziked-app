import 'package:flutter/material.dart';
import 'package:sziked/widgets/home_card_widget.dart';

class WidgetProvider extends ChangeNotifier {
  List<Widget> widgets = [];

  void addWidget({required String templateType, String? grade}) {
    if (grade == null) {
      widgets.add(HomeCardWidget(
      usingTemplate: true,
      templateType: templateType,
      title: "Mrrp mrrp meow meow",
      description: "Kemikálium",
      secondaryIcon: Icons.abc,
    ));
    } else {
      widgets.add(HomeCardWidget(
      usingTemplate: true,
      templateType: templateType,
      title: "Mrrp mrrp meow meow",
      description: "Kemikálium",
      secondaryIcon: Icons.abc,
      grade: grade
    ));
    }
    notifyListeners(); // tells UI to rebuild
  }
}
