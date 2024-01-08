class SessionController{
  static final _session = SessionController._internal();

  String? userId;

  factory SessionController(){
    return _session;
  }
  SessionController._internal(){

  }
}