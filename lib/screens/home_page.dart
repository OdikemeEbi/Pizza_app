import 'package:flutter/material.dart';
import 'package:pizaa_app/screens/pizza_page.dart';
import 'package:pizaa_app/screens/widgets/custom_button.dart';
import 'package:pizaa_app/storage/user_storage.dart';
import 'package:pizaa_app/utils/constants/app_colors.dart';
import 'package:pizaa_app/utils/constants/image_constants.dart';
import 'package:pizaa_app/utils/constants/text_constants.dart';
import 'package:pizaa_app/utils/constants/widgets/textstyle.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              // Save the state by setting the isLoggedIn to true
              await UserPreferences.setLogin(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaPage()));
             
             
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.maxFinite,
                height: MediaQuery.sizeOf(context).height / 2,
                color: Color.fromARGB(255, 234, 230, 223),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(ImageConstants.pizza),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      TextConstants.pizzaForYou,
                      style: AppTextStyles.text24,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Image.asset(ImageConstants.flash),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          TextConstants.everyday,
                          style: text18(AppColors.blackColor),
                        )
                      ],
                    ),
                    SizedBox(height: 46),
                    MyButton(
                      text: TextConstants.signUpWithEmail,
                      color: AppColors.amberColor,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    MyButton(
                      color: AppColors.yellowColor,
                      text: TextConstants.signUpWithGoogle,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 36,
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 10,
            right: 30,
            child: Image.asset(height: 420, ImageConstants.chef),
          )
        ],
      ),
    );
  }
}
