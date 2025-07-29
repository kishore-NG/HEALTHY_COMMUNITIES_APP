import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:healthy_communities_flutter_app/home_page.dart';
import 'package:healthy_communities_flutter_app/store/app.reducer.dart';
import 'package:healthy_communities_flutter_app/store/app.state.dart';
import 'package:healthy_communities_flutter_app/views/pages/register_page.dart';
import 'package:overlay_support/overlay_support.dart';

import 'dart:async';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final Store<AppState> store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [thunkMiddleware],
);

Future<void> main() async {
  runApp(
    OverlaySupport(
      child: StoreProvider(
        store: store,
        child: MyApp(
          MaterialApp(debugShowCheckedModeBanner: false, home: RegisterPage()),
        ),
      ),
    ),
  );
}
