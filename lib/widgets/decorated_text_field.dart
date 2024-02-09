import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecoratedTextField extends StatefulWidget {

  final String label;
  final TextInputType typeOfKeyboard;
  final IconData icon;
  final FocusNode focusChange;
  final TextEditingController storeInputValue;
  final bool isHideInputText;
  final String? Function(String?)? validation;
  final int? maxTextLength;
  final void Function(String?)? textFieldChange;
  final TextInputAction? inputActionNextOrDone;
  final Widget? suffixIcon;

  const DecoratedTextField({
    super.key,
    required this.label,
    required this.typeOfKeyboard,
    required this.isHideInputText,
    required this.icon,
    required this.focusChange,
    required this.storeInputValue,
    this.textFieldChange,
    this.validation,
    this.maxTextLength,
    this.inputActionNextOrDone,
    this.suffixIcon
    // this.onDoneAction
  });

  
  // final Function()? onDoneAction;
  @override
  State<DecoratedTextField> createState() => _DecoratedTextFieldState();
}

class _DecoratedTextFieldState extends State<DecoratedTextField> {
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {});
      },
      child: TextFormField(
        controller: widget.storeInputValue,
        onFieldSubmitted: widget.textFieldChange,
        cursorColor: Colors.white,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxTextLength)
        ],
        // onEditingComplete: widget.onDoneAction,
        validator: widget.validation,
        textInputAction: widget.inputActionNextOrDone,
        focusNode: widget.focusChange,
        obscureText: widget.isHideInputText,
        keyboardType: widget.typeOfKeyboard,

        // TextFormField Decorat
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
          label: Padding(
              padding: widget.focusChange.hasFocus
                  ? const EdgeInsets.only(top: 30)
                  : const EdgeInsets.only(top: 0),
              child: Text(widget.label)),
          labelStyle: TextStyle(
              color: widget.focusChange.hasFocus ? Colors.white : Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold),
          prefixIcon: Icon(widget.icon),
          prefixIconColor:
              widget.focusChange.hasFocus ? Colors.white : Colors.grey,
          filled: true,
          fillColor: widget.focusChange.hasFocus
              ? const Color(0xFF645c6c)
              : Colors.transparent,

          errorMaxLines: 3,

          // Enabled Border
          enabledBorder: _commonErrorBorder(Colors.transparent,isForEnable: true),

          // Focused Border
          focusedBorder: _commonErrorBorder(Colors.transparent),

          // Focused Error Border
          focusedErrorBorder:_commonErrorBorder(Colors.red),

          // Error Border
          errorBorder: _commonErrorBorder(Colors.red)
        ),
      ),
    );
  }

  OutlineInputBorder _commonErrorBorder(Color color,{bool isForEnable=false})=> OutlineInputBorder(
            borderSide: isForEnable?BorderSide.none:BorderSide(color: color),
            borderRadius: const BorderRadius.all(
              Radius.circular(22),
            ),
          );
}
