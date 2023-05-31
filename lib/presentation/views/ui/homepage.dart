import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubits/auth_cubit.dart';
import '../cubits/auth_cubits/auth_state.dart';
import 'app_introscreen.dart';
import 'main_home_page.dart';
import 'signin_phone.dart';

class HomePage extends StatelessWidget {




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
