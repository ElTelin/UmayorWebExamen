
import 'package:flutter/cupertino.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool state) => _isLoading=state;

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
