import 'package:hive/hive.dart';

class HiveHelper {
  final Box _userBox = Hive.box('userBox');

  // Tambahkan data pengguna dummy
  void addDummyUser() {
    if (!_userBox.containsKey('email')) {
      _userBox.put('email', 'user@lovetify.com');
      _userBox.put('password', 'password123');
    }
  }

  // Periksa kredensial pengguna
  bool validateUser(String email, String password) {
    final storedEmail = _userBox.get('email');
    final storedPassword = _userBox.get('password');
    return email == storedEmail && password == storedPassword;
  }
}
