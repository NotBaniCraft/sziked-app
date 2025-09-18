import 'package:flutter/material.dart';
import 'package:sziked/widgets/custom_appbar.dart';
import 'package:sziked/helpers/l10n.dart';
import 'package:sziked/helpers/supabase/profile_data_helper.dart';
import 'package:sziked/widgets/welcome_widget.dart';
import 'package:sziked/widgets/home_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:sziked/helpers/home_card_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? user;
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    _loadUser();
  }
  

  Future<void> _loadUser() async {
    user = await ProfileDataHelper.getCustomName();
    setState(() {}); // trigger rebuild so UI updates
  }
  
  @override
  Widget build(BuildContext context) {
    final widgetProvider = Provider.of<WidgetProvider>(context);
    
    return Scaffold(
      appBar: CustomAppBar(title: l10n.home),
      body: user == null 
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              color: Colors.white,
              backgroundColor: Colors.white,
            ),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: WelcomeWidget(user: user!)),
                  SizedBox(height: 24),
                  HomeCardWidget(
                    usingTemplate: true,
                    templateType: "notes",
                    title: "Mrrp mrrp meow meow",
                    description: "Kemikálium",
                    secondaryIcon: Icons.abc,
                  ),
                  ...widgetProvider.widgets,
                ],
              ),
            ),
          ),
    );
  }
}