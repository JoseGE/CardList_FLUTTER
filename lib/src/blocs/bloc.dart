import 'dart:async';
import './validators.dart';
import 'package:rxdart/rxdart.dart';
class Bloc with Validators{
  final _emailController = new BehaviorSubject<String>();
  final _passwordController = new BehaviorSubject<String>();
  
  //Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValue => Observable.combineLatest2(email, password, (e,p) => true);
  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print("Email is $validEmail");
    print("Password is $validPassword");
  }
  void dispose(){
    _emailController.close();
    _passwordController.close();
  }


}

//Single global instance
final bloc = Bloc();
