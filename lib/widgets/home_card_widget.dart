import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    //we need to intiialize!!!!
    required this.usingTemplate,
    this.templateType,
    this.mainIcon,
    this.grade,
    this.letter, 
    this.title,
    this.description,
    this.secondaryIcon,
    this.backgroundIconColor
  });
  
  //real variables so sigma
  final bool usingTemplate;
  final String? templateType;
  final IconData? mainIcon;
  final String? grade; //needs to be a string because i am not converting uselessly
  final String? letter;
  final String? title;
  final String? description;
  final IconData? secondaryIcon;
  final Color? backgroundIconColor;

  Map<String, Color> getColorsFromGrade(String grade) {
    switch (grade) {
      case "1":
        return {
          'grade': Colors.red[400]!,
          'bgColor': Colors.red[900]!.withValues(alpha: 0.5)
        };
      case "2":
        return {
          'grade': Colors.orange,
          'bgColor': Colors.orange[900]!.withValues(alpha: 0.5)
        };
      case "3":
        return {
          'grade': Colors.yellow,
          'bgColor': Colors.yellow[800]!.withValues(alpha: 0.40)
        };
      case "4":
        return {
          'grade': Colors.lightGreen[500]!,
          'bgColor': Colors.lightGreen[800]!.withValues(alpha: 0.3)
        };
      case "5":
        return {
          'grade': Colors.green[700]!,
          'bgColor': Colors.green[900]!.withValues(alpha: 0.5)
        };
      default:
        return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    if (usingTemplate && templateType == "grade") {
      Color gradeColor = getColorsFromGrade(grade!)['grade']!;
      Color bgColor = getColorsFromGrade(grade!)['bgColor']!;
      
      return Card(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                width: 50,
                height: 50,
                child: Center(
                  child: Text(
                    grade!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: gradeColor
                    ),
                    textAlign: TextAlign.center,
                  )
                )
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description!,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(secondaryIcon!)
            ],
          ),
        ),
      );
    } else if (usingTemplate && templateType == "assignment") {
      //if were using the template for homeworks
      
      
      return Card(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.house,
                    size: 30,
                  )
                )
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description!,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(secondaryIcon!)
            ],
          ),
        ),
      );
    } else if (usingTemplate && templateType == "notes") {
      //if were using the template for new class notes, literally only the icon changes but oh well
      
      
      return Card(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.book,
                    size: 30,
                  )
                )
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description!,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(secondaryIcon!)
            ],
          ),
        ),
      );
    } else if (usingTemplate && templateType == "announcement") {
      //if were using the template for new announcements, literally only the icon changes but oh well
      
      
      return Card(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.campaign,
                    size: 30,
                  )
                )
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description!,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(secondaryIcon!)
            ],
          ),
        ),
      );
    }
    
    // Add your non-template widget here
    return Container();
  }
}