import 'package:flutter/material.dart';
import 'package:flutter_orbita/bloc/auth_bloc.dart';
import 'package:flutter_orbita/bloc/nav_bloc.dart';
import 'package:flutter_orbita/interfaces/nav_interface.dart';
import 'package:flutter_orbita/pages/account_view.dart';
import 'package:provider/provider.dart';

class NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = Provider.of<AuthBloc>(context);
    NavBloc navBloc = Provider.of<NavBloc>(context);

    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('account'),
              onTap: () {
                // Update the state of the app.
                // ...
                navBloc.push(AccountEvent());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('cameras'),
              onTap: () {
                // Update the state of the app.
                // ...
                navBloc.push(CamerasEvent());
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Выйти',
            onPressed: () {
              authBloc.closeSession();
            },
          )
        ],
      ),
      body: StreamBuilder<NavInterface>(
        stream: navBloc.navStream,
        builder: (BuildContext context, AsyncSnapshot<NavInterface> snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data is AccountEvent){
              return AccountPage();
            }
            if(snapshot.data is CamerasEvent){
              return Container(color: Colors.yellow);
            }
          }
          return CircularProgressIndicator();
        },
      )
    );
  }
}