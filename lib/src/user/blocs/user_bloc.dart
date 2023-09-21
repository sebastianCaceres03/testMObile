import 'package:prueba/src/user/models/user_model.dart';
import 'package:prueba/src/user/providers/user_provider.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  //email
  final BehaviorSubject<UserModel> _userBlocCollection = BehaviorSubject<UserModel>();
  Stream<UserModel> get userStream => _userBlocCollection.stream;
  late UserModel user;


  //provider
  final provider = UserProvider();

  //cambiar data
  void getUser() async {
    var results = await provider.getUser();
    if (results != null) {
      print(results);
      user = UserModel.fromJson(results);
      print(user.user?.email);
      _userBlocCollection.sink.add(user);
    } else {
      
    }
  }

  void dispose() {
    _userBlocCollection.close();
  }
}