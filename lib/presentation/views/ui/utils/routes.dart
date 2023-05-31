
import 'package:bloc_cubit_app2/presentation/views/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/auth_cubits/auth_state.dart';
import '../app_introscreen.dart';
import '../main_home_page.dart';
import '../otp_screen.dart';
import '../signin_phone.dart';

class Routes{
  static Route? onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case "/" : return MaterialPageRoute(
          builder: (context) => SplashScreen(),
      );

      case "/introRoute" : return MaterialPageRoute(
        builder: (context) => AppIntroScreen(),
      );

      case "/signInWithPhone" : return MaterialPageRoute(
        builder: (context) => SignInWithPhone(),
      );

      case "/otpRoute" :
        Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
        builder: (context) => OtpScreen(phoneNumber: arguments["phoneNumber"]),
      );


      case "/mainHomeRoute" :
        return MaterialPageRoute(
          builder: (context) => MainHomeScreen());

      default: return null;


      // case "/homeRoute" : return MaterialPageRoute(
      //   builder: (context) => BlocProvider.value(
      //     value: BlocProvider.of<AuthCubit>(context),
      //     child: HomePage(),
      //   ),
      // );

      // case "/introRoute" : return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => AuthCubit(),
      //       child: AppIntroScreen(),
      //     )
      // );


      // case "/introRoute" : return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => AuthCubit(),
      //       child: AppIntroScreen(),
      //     )
      // );


    }


  }
}