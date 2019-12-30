import 'package:flutter/material.dart';
import 'package:flutter_orbita/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AccountScreen()
    );
  }
}

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Здравствуйте, Иван Васильевич',
            style: TextStyle(
              color: Theme.of(context).primaryColor
            ),
          )
        ],
      ),
    );
  }
}