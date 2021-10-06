import 'package:flutter/material.dart';

class NotFoundNavigationWidget extends StatelessWidget {
  const NotFoundNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Not found"),
      ),
    );
  }
}
