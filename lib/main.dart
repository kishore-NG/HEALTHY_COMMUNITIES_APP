import 'package:flutter/material.dart';
import 'package:healthy_communities_flutter_app/home_page.dart';
import 'package:healthy_communities_flutter_app/views/pages/login_page.dart';
import 'package:healthy_communities_flutter_app/views/pages/register_page.dart';

void
main() {
  runApp(
    const MyApp(),
  );
}

class MyApp
    extends
        StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title:
          'Flutter Demo',
      theme: ThemeData(
        primarySwatch:
            Colors.blue,
      ),
      debugShowCheckedModeBanner:
          false,
      home:
          const RegisterPage(),
    );
  }
}
