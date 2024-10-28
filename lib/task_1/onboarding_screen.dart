import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mobile_challenge/constents/colors.dart';
import 'package:mobile_challenge/constents/text_styles.dart';
import 'package:mobile_challenge/task_2/sign_in_screen.dart';
import 'package:mobile_challenge/utils/custom_navigator.dart';
import 'package:mobile_challenge/widgets/vertical_scroller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerticalScroller(
        child: Column(
          children: [
            Container(
              height: 470,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage("assets/images/wave.png"),
                  fit: BoxFit.cover
                )
              ),
            ),
            const Spacer(flex: 3,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Life is short and the world is ",
                          style: TextStyles.style1,
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "wide",
                                style: TextStyles.style1.copyWith(
                                  color: CustomColors.orange1
                                ),
                              ),
                              SvgPicture.asset("assets/decorations/underline.svg"),
                            ],
                          )
                        )
                      ]
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world',
                    textAlign: TextAlign.center,
                    style: TextStyles.style2,
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            SizedBox(
              height: 7,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 35,
                    decoration: BoxDecoration(
                      color: CustomColors.blue1,
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 13,
                    decoration: BoxDecoration(
                      color: CustomColors.blue2,
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 6,
                    decoration: BoxDecoration(
                      color: CustomColors.blue2,
                      borderRadius: BorderRadius.circular(16)
                    ),
                  )
                ],
              ),
            ),
            const Spacer(flex: 4),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () => context.push(const SignInScreen()),
                child: const Text("Get Started")
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}