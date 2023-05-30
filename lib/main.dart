import 'package:bloc_cubit_app2/views/cubits/auth_cubits/auth_cubit.dart';
import 'package:bloc_cubit_app2/views/cubits/auth_cubits/auth_state.dart';
import 'package:bloc_cubit_app2/views/ui/app_introscreen.dart';
import 'package:bloc_cubit_app2/views/ui/homepage.dart';
import 'package:bloc_cubit_app2/views/ui/main_home_page.dart';
import 'package:bloc_cubit_app2/views/ui/signin_phone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          // FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Practice Flutter App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: BlocBuilder<AuthCubit, AuthStates>(
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
          ),
          ),
        ),
    );
  }
}