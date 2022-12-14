import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/features/widgets/custom_button.dart';
import 'package:cofee/features/widgets/custom_text.dart';
import 'package:cofee/features/widgets/custom_text_field.dart';
import 'package:cofee/features/widgets/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorStyles.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorStyles.whiteColor,
        foregroundColor: ColorStyles.accentColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 135.h),
              child: SvgPicture.asset(
                'assets/icons/Porige.svg',
                width: 210.w,
                height: 160.h,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.h, left: 16.w, right: 16.w),
              // ignore: prefer_const_constructors
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Нажимая кнопку “Отправить код” вы соглашаетесь со',
                  style: GoogleFonts.montserrat(
                    color: ColorStyles.blackColor,
                    fontSize: 17.h,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: ' сбором персональных данных',
                      style: GoogleFonts.montserrat(
                        color: ColorStyles.accentColor,
                        fontSize: 17.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' и ',
                      style: GoogleFonts.montserrat(
                        color: ColorStyles.blackColor,
                        fontSize: 17.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'пользовательским соглашением',
                      style: GoogleFonts.montserrat(
                        color: ColorStyles.accentColor,
                        fontSize: 17.h,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60.h, left: 16.h, right: 16.h),
                  child: CustomText(
                    title: 'Введите номер телефона',
                    fontSize: 32,
                    centerTitle: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 87.h, left: 16.h, right: 16.h),
                  child: const CustomTextField(),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 24.5.h, left: 16.h, right: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'Я хочу получать уведомления',
                        fontSize: 17.h,
                        fontWeight: FontWeight.w500,
                        centerTitle: false,
                      ),
                      SwitchBtn(
                        onChange: (value) {
                          setState(() {
                            switchValue = !switchValue;
                          });
                        },
                        value: switchValue,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 42.5.h),
                  child: CustomButton(title: 'Отправить код'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
