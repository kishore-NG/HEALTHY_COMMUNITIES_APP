import 'package:healthy_communities_flutter_app/store/app.state.dart';
import 'package:healthy_communities_flutter_app/store/common_data/common_reducer.dart';

AppState
appReducer(
  AppState state,
  action,
) {
  return AppState(
    commonDataState: commonDataReducer(
      state.commonDataState,
      action,
    ),
  );
}
