import 'package:easy_localization/easy_localization.dart';
import '../constants/app/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String? get isValidEmail => this.contains(RegExp(AppConstants.EMAIL_REGEX))
          ? null
          : "Email doesn't valid";
}


