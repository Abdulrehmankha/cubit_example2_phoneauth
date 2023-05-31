import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/auth_cubits/auth_cubit.dart';
import '../../cubits/auth_cubits/auth_state.dart';
import '../signin_phone.dart';

// ignore: must_be_immutable
class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    var responseWidth = MediaQuery.of(context).size.width / 100;
    double responseSetText = MediaQuery.of(context).textScaleFactor;
    
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(80),
        topRight: Radius.circular(80),
      ),
      child: Drawer(
        elevation: 0,
        child: Container(
          // margin: EdgeInsets.zero,
          color: const Color(0xff4162EF),
          child: Column(
            //padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide.none,
                    )
                ),
                padding: EdgeInsets.zero,
                // margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide.none, // Set the bottom border to none
                      ),
                      color: Color(0xff4162EF),
                    ),
                    accountName: Text(
                      "Abdul Rehman Khan".toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                    accountEmail: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Email: ',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          TextSpan(
                              text: "analyst4@ugspk.com",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    currentAccountPicture: Container(
                      // height: responseHeight * (10),
                      width: responseWidth * 16,
                      decoration: const BoxDecoration(

                        shape: BoxShape.circle,
                        color: Color(0xff171e49),
                      ),
                      child: const CircleAvatar(
                        radius: 72 / 2,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage("assets/images/profile.jpeg"),
                      ),
                    ),
                ),
              ),

              // about
              InkWell(
                onTap: () {
                },
                child: ListTile(
                  // tileColor: Colors.white,
                  leading: const Icon(
                    Icons.work,
                    color: Colors.black,
                    size: 26,
                  ),
                  title: Text(
                    "About us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: responseSetText * 16),
                  ),
                ),
              ),

              // contact
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, '/contact');
                },
                child: ListTile(
                  tileColor: Colors.white,
                  leading: const Icon(
                    Icons.contact_page_outlined,
                    color: Colors.black,
                    size: 26,
                  ),
                  title: Text(
                    "Contact us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: responseSetText * 16),
                  ),
                ),
              ),



              BlocConsumer<AuthCubit, AuthStates>(
                builder: (context, state){
                  return InkWell(
                    onTap: (){
                      BlocProvider.of<AuthCubit>(context).logOut();
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //         builder: (context) =>  LoginScreen()),
                      //         (route) => false);
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 26,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: responseSetText * 16),
                      ),
                    ),
                  );
                },
                listener: (context, state){
                  if(state is AuthLoggedOutState){
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInWithPhone()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}