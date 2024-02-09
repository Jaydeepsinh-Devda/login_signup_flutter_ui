import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app1/strings.dart';
import 'package:test_app1/utility.dart';
import 'package:test_app1/widgets/bottom_text.dart';
import 'package:test_app1/widgets/custom_scroll_view.dart';
import 'package:test_app1/widgets/decorated_btn.dart';
import 'package:test_app1/widgets/decorated_text_field.dart';
import 'package:test_app1/widgets/headline_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => Visible();
}

class Visible extends State<LoginPage> {
  final FocusNode _focusNodeOFEmail = FocusNode();
  final FocusNode _focusNodeOfPassword = FocusNode();

  final _formKey = GlobalKey<FormState>();

  // Input Field Values Controller
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201d34),
      body: SafeArea(
        child: CustomScrollWidget(
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image
                _imageAsset(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Headline Text
                    const HeadlineText(
                      headlineText: loginText,
                      subText: loginStringSubText,
                    ),

                    const SizedBox(height: 30),

                    // Form fields
                    _loginForm(context),

                    const SizedBox(height: 30),

                    // Login and Forget Password Button
                    _loginBtnForgetPassBtn(),
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

  // Image Asset
  Widget _imageAsset() => SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: AspectRatio(
          aspectRatio: 1,
          child: SvgPicture.asset(
            "assets/images/img.svg",
            fit: BoxFit.fill,
          ),
        ),
      );

  // Login Form
  Widget _loginForm(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            // Email Text Field
            _emailTextField(),

            const SizedBox(height: 20),

            // Password Text Field
            _passwordTextField()
          ],
        ),
      );

  // Email TextFormField
  Widget _emailTextField() => DecoratedTextField(
        label: emailTextFieldLabelText,
        icon: Icons.email_outlined,
        typeOfKeyboard: TextInputType.emailAddress,
        isHideInputText: false,
        focusChange: _focusNodeOFEmail,
        storeInputValue: _emailController,
        inputActionNextOrDone: TextInputAction.next,
        textFieldChange: (value) {
          FocusScope.of(context).requestFocus(_focusNodeOfPassword);
        },
        validation: Utility.emailValidation,
      );

  // Password TextFormField
  Widget _passwordTextField() => DecoratedTextField(
        label: passwordTextFieldLabelText,
        icon: Icons.lock_outline,
        typeOfKeyboard: TextInputType.visiblePassword,
        isHideInputText: isTrue,
        storeInputValue: _passController,
        focusChange: _focusNodeOfPassword,
        inputActionNextOrDone: TextInputAction.done,
        maxTextLength: 8,
        validation: Utility.passwordValidation,
        suffixIcon: _isVisible(),
      );

  // Visible Text Method
  Widget _isVisible() => IconButton(
        icon: Icon(isTrue ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          isTrue = !isTrue;
          setState(() {});
        },
      );

  // Login And Forget Password Button
  Widget _loginBtnForgetPassBtn() => Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            // Decorated Btn
            _loginBtn(),

            //Forget Password Button
            _forgetPassBtn()
          ],
        ),
      );

  // Login Button
  Widget _loginBtn() => DecoratedBtn(
        text: loginText.toUpperCase(),
        onClick: _loginBtnValidate,
      );

  Widget _forgetPassBtn() => TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/forgetpassword");
        },
        child: const Text(
          forgetPassword,
          style: TextStyle(
            color: Color.fromARGB(255, 72, 255, 243),
          ),
        ),
      );

  Widget _bottomText() => BottomText(
        darkText: bottomLoginPageText,
        lightText: signUpText,
        onCLick: () {
          Navigator.of(context).pushNamed('/register');
        },
      );

  // Login Button Click Event
  void _loginBtnValidate() {
    if (_formKey.currentState!.validate()) {
      debugPrint(
          "LOGIN VALIDATION :$emailTextFieldLabelText : ${_emailController.text} \n $passwordTextFieldLabelText : ${_passController.text}");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green,
          content: Text(
            loginSuccessText,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }
}
