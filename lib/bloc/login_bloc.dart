import 'package:flutter_orbita/bloc/auth_bloc.dart';
import 'package:flutter_orbita/models/login_model.dart';
import 'package:flutter_orbita/pages/auth_view.dart';
import 'package:flutter_orbita/resources/auth_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  LoginModel _loginModel = LoginModel(
    username: '',
    password: ''
  );
  AuthRepository _repository = AuthRepository();
  
  BehaviorSubject<String> _username = BehaviorSubject<String>();
  BehaviorSubject<String> _password = BehaviorSubject<String>();

  get usernameStream => _username.stream;
  get passwordStream => _password.stream;

  get changeUsername => _username.sink.add;
  get changePassword => _password.sink.add;

  LoginBloc() {
    _username.listen((value) => _loginModel.username = value);
    _password.listen((value) => _loginModel.password = value);
  }

  void login(AuthBloc authBloc) async {
    debug();
    String token = await _repository.login(_loginModel);

    authBloc.openSession(token);
  }

  void debug() {
    _loginModel.debug();
  }

  void dispose() {
    _username.close();
    _password.close();
  }
}