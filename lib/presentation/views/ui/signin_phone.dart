// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubits/auth_cubit.dart';
import '../cubits/auth_cubits/auth_state.dart';



class SignInWithPhone extends StatelessWidget {
  SignInWithPhone({Key? key}) : super(key: key);
  
  String selectCountry = "Pakistan";
  List<String> interests = [
    "Pakistan",
  ];

  String countryCode = '+92';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double responseHeight = MediaQuery.of(context).size.height / 100;
    double responseWidth = MediaQuery.of(context).size.width / 100;
    double responseText = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFCFF),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 20,
              color: Color(0xff323232),
            )),
      ),
      backgroundColor: const Color(0xffFAFCFF),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter your mobile number",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: responseText * 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: responseHeight * 3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Choose your country and enter you mobile number to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xff323232),
                        fontSize: responseText * 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: responseHeight * 2,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                        const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: Container(
                          height: responseHeight * 8,
                          decoration: const ShapeDecoration(
                            color: Color(0xffFAFCFF),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Color(0xffDADADA),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(05),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 20),
                          child: DropdownButtonFormField(
                            items: interests.map<DropdownMenuItem<String>>(
                                    (value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: const Color(0xff000000),
                                        fontSize: responseText * 13,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  );
                                }).toList(),
                            value: selectCountry,
                            onChanged: (String? value) {
                              selectCountry = value!;
                              if (value == 'Pakistan') {
                                countryCode = '+92';
                              } else {
                                debugPrint("Error");
                              }
                            },
                            dropdownColor: const Color(0xffffffff),
                            //hint: Text('----Select Status----',style: TextStyle(color: Colors.black, fontSize: responseText *(12)),),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xff000000),
                            ),

                            iconSize: 22,
                            elevation: 50,
                            isExpanded: true,
                            decoration: InputDecoration(
                              prefix: selectCountry == "Pakistan"
                                  ? const Text("🇵🇰   ")
                                  : const Text('🇬🇧   '),
                              isCollapsed: true,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              //prefixIcon: Icon(Icons.flag_outlined, size: 20, color: Color(0xff323232),)
                            ),
                          ),
                        ),
                      ),


                    SizedBox(
                      height: responseHeight *1,
                    ),
                    SizedBox(
                      //height: responseHeight *(6),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: TextFormField(
                          controller: phoneController,
                          style: TextStyle(
                            fontSize: responseText * 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: responseText * 12,
                                color: Colors.red,
                              ),
                              errorBorder: const OutlineInputBorder(
                                gapPadding: 6.0,
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                gapPadding: 6.0,
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              //contentPadding: EdgeInsets.only(top: 5,left: 20),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    top: 13, left: 10),
                                child: Text(
                                  countryCode,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xffDADADA)),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xffDADADA)),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                              hintText: 'Mobile Number Here',
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: responseText * 13,
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          keyboardType: TextInputType.number,
                          validator: (var value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Mobile Number Here';
                            }
                            if (value.contains('*') || value.length != 10) {
                              return 'Not a valid number.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: responseHeight * 1,
                    ),


                    SizedBox(
                      height: responseHeight * 4,
                    ),

                    BlocConsumer<AuthCubit, AuthStates>(
                      builder: (context, state){

                        if(state is AuthLoadingState){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          child: SizedBox(
                            height: responseHeight * 6,
                            width: responseWidth * 90,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: const Color(0xff4162EF),
                                ),
                                onPressed: () {
                                  String phoneNumber = countryCode + phoneController.text;
                                  BlocProvider.of<AuthCubit>(context).sendOtp(phoneNumber);
                                  // if (_formKey.currentState!.validate()) {
                                  // loginController.sendOtp(
                                  //     context,
                                  //     loginController.countryCode.value,
                                  //     loginController.phoneController.text);
                                  //Navigator.pushNamed(context, '/otpRoute');
                                  //}
                                },
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    color: const Color(0xffffffff),
                                    fontSize: responseText * 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        );
                      },
                      listener: (context, state){
                        if(state is AuthCodeSentState){
                          Navigator.pushNamed(context, '/otpRoute', arguments: {
                            "phoneNumber" : countryCode + phoneController.text
                          });
                        }
                      },
                    ),

                    SizedBox(
                      height: responseHeight * 3,
                    ),

                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            margin:
                            const EdgeInsets.only(left: 18.0, right: 15.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 50,
                            )),
                      ),
                      const Text(
                        "or",
                        style: TextStyle(
                          color: Color(0xff323232),
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin:
                            const EdgeInsets.only(left: 15.0, right: 18.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 50,
                            )),
                      ),
                    ]),

                    SizedBox(
                      height: responseHeight * 2,
                    ),

                    // Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 18, right: 18),
                    //     child: RichText(
                    //       text: TextSpan(
                    //         text: 'Already a user? ',
                    //         style: TextStyle(
                    //             color: const Color(0xff5D5D5D),
                    //             fontSize: responseText * 12,
                    //             fontWeight: FontWeight.normal),
                    //         children: <TextSpan>[
                    //           TextSpan(
                    //             recognizer: TapGestureRecognizer()
                    //               ..onTap = () {
                    //                 // Navigator.pushNamed(
                    //                 //     context, '/loginScreen');
                    //               },
                    //             text: 'Login ',
                    //             style: TextStyle(
                    //                 color: const Color(0xff4162EF),
                    //                 fontSize: responseText * 12,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
