import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);

  TextEditingController otpCode = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double responseHeight = MediaQuery.of(context).size.height / 100;
    double responseWidth = MediaQuery.of(context).size.width / 100;
    double responseText = MediaQuery.of(context).textScaleFactor;

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffFAFCFF),
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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: responseHeight *(2),
              ),
              Text(
                "Verification code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff323232),
                  fontSize: responseText *(25),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: responseHeight *(3),
              ),
              Text(
                "SMS with code has been sent to",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff323232),
                  fontSize: responseText *(14),
                ),
              ),
              Text(
                '+92-3357540426',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff323232),
                  fontSize: responseText *(14),
                ),
              ),
              SizedBox(
                height: responseHeight *(6),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PinCodeTextField(
                  // enablePinAutofill: false,
                  controller: otpCode,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                  ],
                  appContext: context,
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  autoFocus: true,
                  pinTheme: PinTheme(
                    activeFillColor: Theme.of(context).primaryColor,
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(20),
                    // fieldHeight: height * 0.1,
                    fieldWidth: width * 0.15,
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: Colors.grey.withOpacity(.5),
                  ),
                  length: 5,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: responseHeight *(2),
              ),
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       start.value == 0
              //           ? Transform.rotate(
              //         angle: 90 * math.pi / 90,
              //         child: IconButton(
              //           onPressed: () {
              //             // if (loginController.start.value == 0) {
              //             //   otpCode.clear();
              //             // }
              //             // loginController.runagain();
              //           },
              //           icon: Icon(
              //             Icons.replay,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       )
              //           : const Text(''),
              //       loginController.start.value != 0
              //           ? Text(
              //         'Resend code in ' +
              //             loginController.start.value.toString() +
              //             "s",
              //         style: const TextStyle(
              //             fontSize: 14, color: Colors.grey),
              //       )
              //           : const Text(
              //         'Resend code',
              //         style: TextStyle(fontSize: 14, color: Colors.black),
              //       ),
              //     ],
              //   ),

              SizedBox(
                height: responseHeight * 8,
              ),
              const SizedBox(
                height: 20,
              ),

              Padding(
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

                      },
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          color: const Color(0xffffffff),
                          fontSize: responseText * 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              // Center(
              //     child: CustomAppButtonWidget("Verify", () {
              //       // if (otpCode.text == '' || otpCode.text.length != 5) {
              //       //   AppConstants.showmessage(context, 'Please Enter Code');
              //       // } else {
              //       //   loginController.verifydOtp(context, otpCode.text);
              //       // }
              //     },
              //         responseHeight * 6.5,
              //         responseWidth * 80
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
