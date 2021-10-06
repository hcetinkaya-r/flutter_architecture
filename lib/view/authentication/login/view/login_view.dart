import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view.dart';
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
    onPageBuilder: (context, value) => Scaffold(),
    );
    }
  }
