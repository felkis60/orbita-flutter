import 'package:flutter/material.dart';
import 'package:flutter_orbita/interfaces/nav_interface.dart';
import 'package:rxdart/rxdart.dart';

class NavBloc {
  BuildContext _context;

  BehaviorSubject<NavInterface> _nav = BehaviorSubject<NavInterface>.seeded(AccountEvent());

  get navStream => _nav.stream;

  NavBloc(BuildContext context) {
    _context = context;
    //_nav.listen(pushNamed);
  }

  void push(NavInterface nav) {
    _nav.sink.add(nav);
    Navigator.pushNamed(_context, nav.path);
  }

  void pushNamed(NavInterface nav) {
    print(nav.path);
    //_navigatorKey.currentState.pushNamed(nav.path);
  }
}