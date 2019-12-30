import 'package:align_positioned/align_positioned.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_orbita/bloc/auth_bloc.dart';
import 'package:flutter_orbita/bloc/login_bloc.dart';
import 'package:flutter_orbita/ui/bordered_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm()
    );
  }
}

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          _buildHeader(),
          _buildForm(context)
        ],
      )
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 178.3,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/img/orbita-bg.svg',
              height: 178.3,
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Text('Авторизация'),
            )
          )
        ],
      )
    );
  }

  Widget _buildForm(BuildContext context) {
    AuthBloc authBloc = Provider.of<AuthBloc>(context);

    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              bottom: 25.0
            ),
            child: BorderedTextField(
              labelText: 'Логин',
              onChanged: _loginBloc.changeUsername,
            ),
          ),
          BorderedTextField(
            labelText: 'Пароль',
            onChanged: _loginBloc.changePassword
          ),
          RaisedButton(
            onPressed: () => _loginBloc.login(authBloc),
          )
        ],
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }
}