import 'package:bloc_cubit_app2/views/ui/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({Key? key}) : super(key: key);

  
  String appBarTitle = 'Home';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xff4162EF),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(appBarTitle, style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
        leading: InkWell(
          onTap: (){
            if(scaffoldKey.currentState!.isDrawerOpen){
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            }else{
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
          child: const Icon(
              Icons.menu,
            color: Colors.white,
            size: 26,
          ),
        ),
        centerTitle: true,
      ),
      drawer: DrawerScreen(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome! Buddy", style: Theme.of(context).textTheme.headlineMedium,)
          ],
        ),
      ),
    );
  }
}




