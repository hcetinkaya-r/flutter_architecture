import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../viewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      (model) {
        model.setContext(context);
      },
      viewModel: LoginViewModel(),
      onPageBuilder: (context, value) => buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              padding: context.paddingLow,
              height: context.height * .4,
              color: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
              child: buildText(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.lowValue),
            ),
          ],
        ),
      );

  Text buildText(BuildContext context) {
    return Text(
      "Hello",
      style: context.textTheme.headline1!.copyWith(
          color: context.theme.primaryColor, fontWeight: FontWeight.bold),
    );
  }
}
