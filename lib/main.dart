import 'package:flutter/material.dart';
import 'package:flutter_orbita/bloc/auth_bloc.dart';
import 'package:flutter_orbita/bloc/nav_bloc.dart';
import 'package:flutter_orbita/pages/account_view.dart';
import 'package:flutter_orbita/pages/auth_view.dart';
import 'package:flutter_orbita/pages/nav_view.dart';
import 'package:provider/provider.dart';

AuthBloc authBloc = AuthBloc();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NavBloc navBloc = NavBloc(context);

    authBloc.restoreSession();

    return MultiProvider(
      providers: [
        Provider<AuthBloc>.value(value: authBloc),
        Provider<NavBloc>.value(value: navBloc)
      ],
      child:  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF2185c6)
        ),
        home: _buildContent()
      )
    );
  }

  Widget _buildContent() {
    return StreamBuilder<bool>(
      stream: authBloc.sessionStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none: return Text('Select lot');
          case ConnectionState.waiting: return Text('Awaiting bids...');
          case ConnectionState.active: 
            if(snapshot.hasData && snapshot.data){
              return NavPage();
            } else {
              return AuthPage();
            }
            break;
          case ConnectionState.done: return Text('\$${snapshot.data} (closed)');
        }
        return null; // unreachable
      },
    );
  }
}

