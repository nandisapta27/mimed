import 'package:flutter/material.dart';
import 'package:my_mimed/pages/education_page.dart';
import 'package:my_mimed/pages/podomo_page.dart';
import '../themes.dart';

// HomeRoute

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgMain,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
          child: Column(
            children: [
              Text(
                "Mind Meditation",
                style: TextStyle(
                    fontSize: 36,
                    color: secondaryPrimaryColor,
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 34,),
                  SizedBox(height: 100,width: 300,child: ElevatedButton.icon(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PodomoPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: secondaryPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0)
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0)
                    ),
                    icon: const Icon(
                      Icons.timelapse,
                      size: 49,
                    ),
                    label: const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text(
                        "Podomoro",
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(height: 34),
                  SizedBox(height: 100,width: 300,child: ElevatedButton.icon(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EducationRoute()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: secondaryPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0)
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0)
                    ),
                    icon: const Icon(
                      Icons.school,
                      size: 49,
                    ),
                    label: const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text(
                        "Education",
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}