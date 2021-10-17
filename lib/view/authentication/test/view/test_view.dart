import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/language/language_manager.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../test_view_model.dart';

class TestView extends StatefulWidget {
  TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      (model) {
        model.setContext(context);

        viewModel = model;
      },
      viewModel: TestViewModel(),
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  IconButton iconButtonChangeTheme() {
    return IconButton(
      onPressed: () {
        context.setLocale(LanguageManager.instance.enLocale);
      },
      icon: Icon(Icons.change_history),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: Text(LocaleManager.instance
          .getStringValue(PreferencesKeys.TOKEN)
          .toString()),
      title: textWelcomeWidget(),
      actions: [
        iconButtonChangeTheme(),
      ],
    );
  }

  Widget get textNumber {
    return Column(
      children: [
        emailField,
        Observer(builder: (context) {
          return Text(
            viewModel.number.toString(),
          );
        }),
      ],
    );
  }

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel.incrementNumber(),
    );
  }
}

extension _FormArea on _TestViewState {
  TextFormField get emailField =>
      TextFormField(validator: (value) => value!.isValidEmail);
}

