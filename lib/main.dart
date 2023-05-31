import 'package:bloc_cubit_app2/data/repositories/post_repository.dart';
import 'package:bloc_cubit_app2/logic/cubits/postcubit/post_cubit.dart';
import 'package:bloc_cubit_app2/presentation/views/cubits/auth_cubits/auth_cubit.dart';
import 'package:bloc_cubit_app2/presentation/views/cubits/auth_cubits/auth_state.dart';
import 'package:bloc_cubit_app2/presentation/views/ui/app_introscreen.dart';
import 'package:bloc_cubit_app2/presentation/views/ui/main_home_page.dart';
import 'package:bloc_cubit_app2/presentation/views/ui/signin_phone.dart';
import 'package:bloc_cubit_app2/presentation/views/ui/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async{
  PostRepository postRepository = PostRepository();
  postRepository.fetchPosts();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<PostCubit>(
          create: (context) => PostCubit(),
        ),
        // Add more Cubit providers as needed
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
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
          onGenerateRoute: Routes.onGenerateRoute,
          // initialRoute: "/splash",
          ),
        ),
    );
  }
}