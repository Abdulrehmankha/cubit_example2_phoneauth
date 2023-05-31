import 'dart:async';
import 'package:bloc_cubit_app2/presentation/views/ui/signin_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubits/auth_cubit.dart';
import '../cubits/auth_cubits/auth_state.dart';
import 'app_introscreen.dart';
import 'main_home_page.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  // void checkState(){
  String weblink = "www.connectrehmankhan.com";

  String poweredText = "Powered By";

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.pushNamed(context, '/home');
    });

    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/getstart.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 14,
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to Authentication App',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  poweredText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: height * 2,
            ),

            Text(
              weblink,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(
              height: height * 2,
            ),
          ],
        ),
      ),
    );
  }
}



class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthCubit, AuthStates>(
        buildWhen: (oldState, newState){
          return oldState is AuthInitialState;
        },
        builder: (context, state){
          if(state is AuthLoggedInState){
            return MainHomeScreen();
          } else if (state is AuthLoggedOutState){
            return SignInWithPhone();
          } else {
            return AppIntroScreen();
          }
        }
    );
  }
}