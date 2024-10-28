import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mobile_challenge/constents/colors.dart';
import 'package:mobile_challenge/constents/text_styles.dart';
import 'package:mobile_challenge/task_3/hotel_screen.dart';
import 'package:mobile_challenge/widgets/vertical_scroller.dart';
import 'package:mobile_challenge/utils/custom_navigator.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset('assets/icons/arrow_back_ios.svg')
        ),
      ),
      body: const Center(
        child: VerticalScroller(
          child: Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Text(
                "Sign in now",
                style: TextStyles.style4,
              ),
              Text(
                "Please sign in to continue our app",
                style: TextStyles.style2,
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SignInForm(),
              ),
              SizedBox(height: 40),
              HelperText(),
              SizedBox(height: 20),
              Spacer(flex: 5),
              OAuthButtons(),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

class HelperText extends StatelessWidget {
  const HelperText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Dont have an account? ",
            style: TextStyles.style2
          ),
          TextSpan(
            text: "Sign up",
            style: TextStyles.style2.copyWith(
              color: CustomColors.blue1
            ),
            recognizer: TapGestureRecognizer()..onTap = (){}
          ),
          const TextSpan(
            text: "\n\nOr connect",
            style: TextStyles.style2
          ),
        ]
      ),
    );
  }
}

class OAuthButtons extends StatelessWidget {
  const OAuthButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: (){},
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: SvgPicture.asset("assets/icons/fb.svg"),
        ),
        const SizedBox(width: 17),
        InkWell(
          onTap: (){},
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: SvgPicture.asset("assets/icons/insta.svg"),
        ),
        const SizedBox(width: 17),
        InkWell(
          onTap: (){},
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          child: SvgPicture.asset("assets/icons/twitter.svg"),
        )
      ],
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordKey = GlobalKey<FormState>();
    final emailKey = GlobalKey<FormState>();

    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    final passwordRegex = RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

    bool isValidEmail(String email) => emailRegex.hasMatch(email);
    bool isValidPassword(String password) => passwordRegex.hasMatch(password);

    return Column(
      children: [
        Form(
          key: emailKey,
          child: CustomTextField(
            hint: "Your email",
            validator: (value) {
              if (!isValidEmail(value ?? "")) {
                return "Enter a valid email";
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 25),
        Form(
          key: passwordKey,
          child: CustomTextField(
            hint: "Your password",
            addVisibilityToggler: true,
            validator: (value) {
              if (!isValidPassword(value ?? "")) {
                return "Password must be at least 8 characters long and include an uppercase letter, lowercase letter, number, and special character.";
              }
              return null;
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              final emailValid = emailKey.currentState!.validate();
              if (emailValid) {}
            }, 
            child: const Text("Forget Password?")
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: (){
              final isPasswordValid = passwordKey.currentState!.validate();
              final isEmailValid = emailKey.currentState!.validate();
              final isFormValid = isEmailValid && isPasswordValid;
              if (isFormValid) {
                context.push(const HotelScreen());
              }
            }, 
            child: const Text("Sign Up")
          ),
        )
      ],
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key, 
    this.controller, 
    this.validator,
    this.hint,
    this.addVisibilityToggler = false
  });

  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final String? hint;
  final bool addVisibilityToggler;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool showText;

  void toggleTextVisibility() => setState(() {showText = !showText;});

  @override
  void initState() {
    showText = widget.addVisibilityToggler;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var enabledBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(14)
    );
    var errorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(14)
    );
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: showText,
      obscuringCharacter: "*",
      cursorColor: CustomColors.black1,
      style: TextStyles.style2.copyWith(
        color: Colors.black
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyles.style2,
        fillColor: CustomColors.grey2,
        filled: true,
        enabledBorder: enabledBorder,
        disabledBorder: enabledBorder,
        border: enabledBorder,
        focusedBorder: enabledBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: enabledBorder,
        errorMaxLines: 3,
        errorStyle: TextStyles.style5.copyWith(
          color: Colors.red
        ),
        contentPadding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 13
        ),
        suffixIconConstraints: const BoxConstraints(maxWidth: 37),
        suffixIcon: widget.addVisibilityToggler ? Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () => toggleTextVisibility(),
            child: SvgPicture.asset("assets/icons/hide.svg")
          ),
        ) : null
      ),
    );
  }
}