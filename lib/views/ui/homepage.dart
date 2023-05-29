import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width  /  100;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 2,
              ),
              Image.asset('assets/images/logo.png', height: 300, width: 300,),
              SizedBox(
                height: height * 2,
              ),

              Form(
                key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          autofocus: false,
                          autocorrect: true,
                          decoration: InputDecoration(

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1, style: BorderStyle.solid)
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(

                              borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: const Text("Enter Email Here"),
                            labelStyle: TextStyle(
                              color: Colors.grey[700],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          validator: (value){
                            String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = new RegExp(p);
                            if(emailController.text == null || emailController.text != regExp.pattern){
                              return 'Enter valid email';
                            }
                          },


                        ),
                        SizedBox(
                          height: height * 2,
                        ),

                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passController,
                          autofocus: false,
                          obscureText: true,
                          decoration: InputDecoration(

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1, style: BorderStyle.solid)
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(

                              borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: const Text("Enter Password Here"),
                            labelStyle: TextStyle(
                              color: Colors.grey[700],
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          validator: (value){
                            if(passController.text == null || passController.text.length > 8){
                              return 'Your Password Should be 7 digits';
                            }
                          },


                        ),


                        SizedBox(
                          height: height * 8,
                        ),

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
                                if (_formkey.currentState!.validate()) {
                                  // Form is valid, submit data
                                  debugPrint('Form Correct');
                                }
                              },
                              child: const Text("Sign In", style: TextStyle(
                            color: Colors.white,
                          ),)),
                        ),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
