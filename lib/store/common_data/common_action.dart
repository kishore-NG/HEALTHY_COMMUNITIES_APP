import 'dart:convert' as convert;
import 'dart:developer';

import 'package:healthy_communities_flutter_app/config.dart';
import 'package:healthy_communities_flutter_app/store/app.state.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class CommonAction {
  @override
  String toString() {
    return 'CommonAction';
  }
}

class UpdateToken
    extends
        CommonAction {
  final String token;

  UpdateToken(
    this.token,
  );

  @override
  String toString() {
    return 'UpdateToken{token: $token}';
  }
}

ThunkAction<
  AppState
>
register({
  required String firstName,
  required String phoneNumber,
  required String zipCode,
  required String email,
  required String password,
}) {
  return (
    Store<
      AppState
    >
    store,
  ) async {
    final response = await http.post(
      Uri.parse(
        '${AppConfig.apiURL}/api/auth/user-register',
      ),
      headers: {
        'Content-Type':
            'application/json',
      },
      body: convert.jsonEncode(
        {
          'first_name':
              firstName,
          'phone':
              phoneNumber,
          'zip':
              zipCode,
          'email':
              email,
          'password':
              password,
        },
      ),
    );
    final body = convert.jsonDecode(
      response.body,
    );

    if (response.statusCode ==
        200) {
      log(
        'User registered successfully: ${body['message']}',
      );
    } else {
      log(
        'Failed to register user: ${body['error']}',
        error:
            body['error'],
      );
    }
  };
}
