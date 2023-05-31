import 'package:bloc_cubit_app2/logic/cubits/postcubit/post_cubit.dart';
import 'package:bloc_cubit_app2/logic/cubits/postcubit/post_state.dart';
import 'package:bloc_cubit_app2/presentation/views/ui/widgets/drawer.dart';
import 'package:bloc_cubit_app2/presentation/views/ui/widgets/postcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({Key? key}) : super(key: key);

  
  String appBarTitle = 'Home';
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;

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
      drawer: const DrawerScreen(),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.black87,
            toolbarHeight: 50,
            toolbarTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
            stretch: true,
            automaticallyImplyLeading: false,
            title: Center(
                child:
                Text(
                  "Latest Articles",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),)),
            pinned: true, // Keep the app bar visible when scrolling
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocConsumer<PostCubit, PostState>(
                  builder: (context, state){
                    if(state is PostLoadingState){
                      return SizedBox(
                        height: height * 75,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is PostLoadedState){
                      return PostCards(state.posts);
                    }
                    return SizedBox(
                      height: height * 75,
                      child: const Center(
                        child: Text('An Error Occurred!'),
                      ),
                    );
                  },
                  listener: (context, state){
                    if(state is PostErrorState){
                      SnackBar snackBar = SnackBar(
                        content: Text(state.error),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



}




