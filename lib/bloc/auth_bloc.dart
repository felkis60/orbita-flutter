import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc {
  String _token = '';
  PublishSubject<bool> _session = PublishSubject<bool>();

  Stream<bool> get sessionStream => _session.stream;

  void openSession(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
    _token = token;
    _session.sink.add(true);
  }

  void restoreSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _token = prefs.getString('token');
    if(_token != null && _token.length > 0) {
      _session.sink.add(true);
    } else {
      _session.sink.add(false);
    }
  }

  void closeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _token = '';
    await prefs.setString('token', _token);
    _session.sink.add(false);
  }
}