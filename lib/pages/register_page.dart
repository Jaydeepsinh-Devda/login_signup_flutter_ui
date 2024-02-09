import 'package:flutter/material.dart';
import 'package:test_app1/Widgets/decorated_btn.dart';
import 'package:test_app1/strings.dart';
import 'package:test_app1/utility.dart';
import 'package:test_app1/widgets/bottom_text.dart';
import 'package:test_app1/widgets/custom_scroll_view.dart';
import 'package:test_app1/widgets/decorated_text_field.dart';
import 'package:test_app1/widgets/headline_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FocusNode _focusNodeOfName = FocusNode();
  final FocusNode _focusNodeOfPhone = FocusNode();
  final FocusNode _focusNodeOfEmail = FocusNode();
  final FocusNode _focusNodeOfPassword = FocusNode();
  final FocusNode _focusNodeOfConfirmPassword = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _isTextVisible = true;

  // Input Fields values Controller
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201d34),
      appBar: AppBar(
        backgroundColor: const Color(0xFF201d34),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: CustomScrollWidget(
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Headline Text
                    const HeadlineText(
                      headlineText: createAccountText,
                      subText: createAccountSubText,
                    ),

                    const SizedBox(height: 25),

                    // Form Fields
                    _registerForm(context),

                    const SizedBox(height: 30),

                    // SIGN UP Button
                    _signUpBtnWithAlign(),
                  ],
                ),

                const SizedBox(height: 12),

                // Bottom Text
                _bottomText()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerForm(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            // Full Name Text Field
            _fullNameTextField(),

            const SizedBox(height: 20),

            // Phone Text Field
            _phoneTextField(),

            const SizedBox(height: 20),

            // Email Text Field
            _emailTextField(),

            const SizedBox(height: 20),

            // Password Text Field
            _passwordTextField(),

            const SizedBox(height: 20),

            // Confirm PAssword TExt Field
            _confirmPasswordTextField()
          ],
        ),
      );

  // Full Name TextFormField
  Widget _fullNameTextField() => DecoratedTextField(
        label: fullNameTextFieldLabelText,
        icon: Icons.person_outline,
        typeOfKeyboard: TextInputType.name,
        isHideInputText: false,
        storeInputValue: _fullNameController,
        focusChange: _focusNodeOfName,
        inputActionNextOrDone: TextInputAction.next,
        validation: _fullNameValidation,
        textFieldChange: (value) {
          FocusScope.of(context).requestFocus(_focusNodeOfPhone);
        },
      );

  // Phone TextFormField
  Widget _phoneTextField() => DecoratedTextField(
        label: phoneTextFieldLabelText,
        icon: Icons.phone_android_sharp,
        typeOfKeyboard: TextInputType.phone,
        isHideInputText: false,
        storeInputValue: _phoneController,
        focusChange: _focusNodeOfPhone,
        inputActionNextOrDone: TextInputAction.next,
        validation: _mobileNumValidation,
        maxTextLength: 10,
        textFieldChange: (value) {
          FocusScope.of(context).requestFocus(_focusNodeOfEmail);
        },
      );

  // Email TextFormField
  Widget _emailTextField() => DecoratedTextField(
        label: emailTextFieldLabelText,
        icon: Icons.email_outlined,
        typeOfKeyboard: TextInputType.emailAddress,
        isHideInputText: false,
        storeInputValue: _emailController,
        focusChange: _focusNodeOfEmail,
        inputActionNextOrDone: TextInputAction.next,
        validation: Utility.emailValidation,
        textFieldChange: (value) {
          FocusScope.of(context).requestFocus(_focusNodeOfPassword);
        },
      );

  // Password TextFormField
  Widget _passwordTextField() => StatefulBuilder(
        builder: (context, setState) {
          return DecoratedTextField(
            label: passwordTextFieldLabelText,
            icon: Icons.lock_outline,
            typeOfKeyboard: TextInputType.visiblePassword,
            isHideInputText: _isTextVisible,
            storeInputValue: _passwordController,
            focusChange: _focusNodeOfPassword,
            inputActionNextOrDone: TextInputAction.next,
            validation: Utility.passwordValidation,
            maxTextLength: 8,
            suffixIcon: _isVisible(setState),
            textFieldChange: (value) {
              FocusScope.of(context).requestFocus(_focusNodeOfConfirmPassword);
            },
          );
        },
      );

  // Confirm PasswordTextField
  Widget _confirmPasswordTextField() => StatefulBuilder(
        builder: (context, setState) {
          return DecoratedTextField(
            label: confirmPasswordTextFieldLabelText,
            icon: Icons.lock_outline,
            typeOfKeyboard: TextInputType.visiblePassword,
            isHideInputText: _isTextVisible,
            storeInputValue: _confirmPasswordController,
            focusChange: _focusNodeOfConfirmPassword,
            inputActionNextOrDone: TextInputAction.done,
            maxTextLength: 8,
            suffixIcon: _isVisible(setState),
            validation: _confirmPasswordValidation,
          );
        },
      );

  Widget _isVisible(void Function(void Function()) setState) => IconButton(
        icon: Icon(_isTextVisible ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          _isTextVisible = !_isTextVisible;
          setState((){});
        },
      );

  // Sign Up Button With Alignment
  Widget _signUpBtnWithAlign() => Align(
        alignment: Alignment.center,
        child: _singUpBtn(),
      );

  // Decorated Button
  Widget _singUpBtn() => DecoratedBtn(
        text: signUpText.toUpperCase(),
        onClick: () {
          _onSignUpBtnValidate(context);
        },
      );

  // Bottom Text
  Widget _bottomText() => BottomText(
        darkText: bottomSignUpPageText,
        lightText: signIn,
        onCLick: () {
          Navigator.of(context).pop();
        },
      );

  // On Sign Up Button Click
  void _onSignUpBtnValidate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      debugPrint(
          "SIGN UP VALIDATION : $fullNameTextFieldLabelText  : ${_fullNameController.text} \n $phoneTextFieldLabelText : ${_phoneController.text} \n $emailTextFieldLabelText : ${_emailController.text} \n $passwordTextFieldLabelText : ${_passwordController.text} \n $confirmPasswordTextFieldLabelText : ${_confirmPasswordController.text}");
      Navigator.of(context).pop();
    }
  }

  // Full Name Validation
  String? _fullNameValidation(String? value) {
    bool fullNameReg = RegExp(fullNameRegExp).hasMatch(value!);
    if (value.isNotEmpty) {
      if (fullNameReg) {
        return null;
      }
    }
    return "Enter a proper name";
  }

  // Mobile Number Validation
  String? _mobileNumValidation(String? value) {
    bool mobileNumReg = RegExp(phoneRegExp).hasMatch(value!);
    if (value.isNotEmpty) {
      if (mobileNumReg) {
        return null;
      }
    }
    return "Enter 10 digit Mobile Number";
  }

  // Confirm Password Validation
  String? _confirmPasswordValidation(String? value) {
    if (value!.isNotEmpty) {
      if (value == _passwordController.text) {
        return null;
      }
    }
    return "It does not match with password";
  }
}
