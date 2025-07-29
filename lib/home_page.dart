import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:healthy_communities_flutter_app/store/app.state.dart';
import 'package:redux/redux.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (store) => store,
      builder: (BuildContext context, store) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: widget.token != null ? (widget.type == 'Company' ? '/company_screen' : '/base_screen') : '/login',
          // onGenerateRoute: (settings) {
          //   print('/////////////////////////User Type: ${widget.type}');
          //   return null;
          // },
          routes: {},
        );
      },
    );
  }
}

class MyApp extends InheritedWidget {
  @override
  final Widget child;

  const MyApp(this.child, {super.key}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static MyApp? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
  }
}
