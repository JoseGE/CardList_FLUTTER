import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email,sink) {
      bool emailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
      if(emailValid){
        sink.add(email);
      }else{
        sink.addError('Email invalido');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password,sink){
      if(password.length >= 4){
        sink.add(password);
      }else{
        sink.addError('Password debe ser mas o igual a 4 caracteres');
      }
    }
  );
}