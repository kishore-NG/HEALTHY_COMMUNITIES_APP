
import 'package:healthy_communities_flutter_app/store/common_data/common_action.dart';
import 'package:healthy_communities_flutter_app/store/common_data/common_state.dart';
import 'package:redux/redux.dart';

final commonDataReducer = combineReducers<CommonDataState>([

  TypedReducer<CommonDataState, UpdateToken>(_updateToken),


]);

CommonDataState _updateToken(CommonDataState state, UpdateToken action) {
  return state.copyWith(token: action.token);
}