import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  static final emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  const Email.pure() : super.pure('');

  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'El campo es requerido';
    if (displayError == EmailError.format) return 'No tiene formato de correo electrónico';

    return null;
  }

  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
