import 'package:flutter/material.dart';

class AppIntroScreen extends StatelessWidget {
  AppIntroScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "App_Intro",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).popUntil((context) => true);
          }, icon:const Icon(Icons.arrow_right_alt_outlined, size: 24,))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(04),
              ),
              height: height * 6.5,
              width:  width * 85,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/homeRoute');
                  },
                  child: const Text("Sign In With Phone", style: TextStyle(
                    color: Colors.white,
                  ),)),
            ),
          ],
        ),
      ),
    );
  }
}
