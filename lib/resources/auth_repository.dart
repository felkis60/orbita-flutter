import 'package:flutter_orbita/models/login_model.dart';

class AuthRepository {
  Future<String> login(LoginModel loginModel) async {
    await Future.delayed(Duration(seconds: 3));
    
    return 'qwerty';
  }
}