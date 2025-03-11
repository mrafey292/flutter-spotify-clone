import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:red/common/widgets/appbar/app_bar.dart';
import 'package:red/common/widgets/button/basic_app_button.dart';
import 'package:red/core/configs/assets/app_images.dart';
import 'package:red/core/configs/assets/app_vectors.dart';
import 'package:red/core/configs/theme/app_colors.dart';
import 'package:red/presentation/auth/pages/signin.dart';
import 'package:red/presentation/auth/pages/signup.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BasicAppBar(),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                AppVectors.topPattern,
                width: 150, // Add width to prevent overflow
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(
                AppVectors.bottomPattern,
                width: 150,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                AppImages.authBG,
                width: 150,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.logo),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Enjoy Listening to Music',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Spotify is a proprietary Swedish audio streaming and media services provider',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: AppColors.darkGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: BasicAppButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignupPage()));
                              },
                              title: 'Register'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SigninPage()));
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
