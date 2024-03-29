import 'package:flutter/material.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/init/network/network_manager.dart';
import 'model/test_model.dart';
import '../../../core/constants/enums/app_theme_enum.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {

  
  void setContext(BuildContext context) => this.context = context;

  void init() {}

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() => number++;

  void changeTheme() {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    final list =
        await NetworkManager.instance.dioGet<TestModel>("x", TestModel());
    if (list is List) {}
    isLoading = false;
  }
}
