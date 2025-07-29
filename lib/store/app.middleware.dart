// ignore: depend_on_referenced_packages
import 'package:healthy_communities_flutter_app/store/app.state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';



List<Middleware<AppState>> appMiddleware() {
//   final Middleware<AppState> _login = login(_repo);

return [
    // TypedMiddleware<AppState, LoginAction>(_login),
    thunkMiddleware,
]; 
}