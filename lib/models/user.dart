class FirebaseUser {
  final String uid;
  FirebaseUser(this.uid);
}

class UserData {
  final String uid;
  final String username;
  final int points;

  UserData({this.uid, this.username, this.points});
}
