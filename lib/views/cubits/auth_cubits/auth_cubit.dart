import 'package:bloc_cubit_app2/views/cubits/auth_cubits/auth_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthStates>{

  final FirebaseAuth _auth =  FirebaseAuth.instance;

  AuthCubit() : super(AuthInitialState());

  String? _verificationId;

  void sendOtp(String phoneNumber)async{
    emit(AuthLoadingState());
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken){
        _verificationId = verificationId;
        emit(AuthCodeSentState());
      },
      verificationCompleted: (phoneAuthCredentials){
        signInWithPhone(phoneAuthCredentials);
      },
      verificationFailed: (error){
        emit(AuthCodeErrorState(error.message.toString()));
      },
      codeAutoRetrievalTimeout: (verificationId){
        _verificationId = verificationId;
      }
    );
  }

  void verifyOtp(String otp)async{
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp
    );
    signInWithPhone(credential);
  }

  void signInWithPhone(PhoneAuthCredential credential)async{

    try{
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      if(userCredential.user != null){
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (ex){
      emit(AuthCodeErrorState(ex.message.toString()));
    }

  }
}