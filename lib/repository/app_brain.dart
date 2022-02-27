class AppBrain {
  AppBrain({required this.brainPassword, required this.brainUserName});

  final String brainUserName;
  final String brainPassword;

  String getUserName() {
    if (brainUserName != null) {
      return '$brainUserName';
    } else {
      return ' you have entered nothing';
    }
  }

  String getPassword() {
    if (brainPassword != null) {
      return '$brainPassword';
    } else {
      return ' you have entered nothing';
    }
  }
}
