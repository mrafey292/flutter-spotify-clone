import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:red/common/widgets/appbar/app_bar.dart';
import 'package:red/common/widgets/button/basic_app_button.dart';
import 'package:red/core/configs/assets/app_vectors.dart';
import 'package:red/core/configs/theme/app_colors.dart';
import 'package:red/data/models/auth/signin_user_req.dart';
import 'package:red/domain/usecases/auth/signin.dart';
import 'package:red/presentation/auth/pages/signup.dart';
import 'package:red/presentation/home/pages/home.dart';
import 'package:red/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 20,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            SizedBox(
              height: 30,
            ),
            // _fullNameField(context),
            SizedBox(
              height: 20,
            ),
            _emailField(context),
            SizedBox(
              height: 20,
            ),
            _passwordField(context),
            SizedBox(
              height: 30,
            ),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SigninUseCase>().call(
                  params: SigninUserReq(
                      email: _email.text.toString(),
                      password: _password.text.toString()),
                );
                result.fold((l) {
                  var snackbar = SnackBar(
                    content: Text(l),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }, (r) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage()),
                      (route) => false);
                });
              },
              title: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: InputDecoration(
        hintText: 'Enter Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not a member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.darkGrey,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SignupPage()));
            },
            child: Text(
              'Register Now',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
