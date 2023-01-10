import 'package:cofee/constants/colors/color_styles.dart';
import 'package:cofee/custom_widgets/custom_text.dart';
import 'package:cofee/features/data/models/cart/cart_model.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/code_accept/view/code_accept.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/congratulations/view/congratulations.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/number_accept/view/number_accept.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/order_user/view/order_user.dart';
import 'package:cofee/features/presentation/cart/widgets/checkout/widgets/selected_cart/view/select_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/choice_time.dart';

class DeliveryBottomsheet extends StatefulWidget {
  final List<CartModel> cartModel;
  final double totalAmount;
  final double totalWeigth;
  const DeliveryBottomsheet({super.key, required this.cartModel, required this.totalAmount, required this.totalWeigth});

  @override
  State<DeliveryBottomsheet> createState() => _DeliveryBottomsheetState();
}

class _DeliveryBottomsheetState extends State<DeliveryBottomsheet> {
  final PageController pageController = PageController();
  late List<Widget> listPages = [
    ChoiceTime(
      pageController: pageController,
    ),
    NumberAccept(
      pageController: pageController,
    ),
    CodeAccept(
      pageController: pageController,
    ),
    OrderUser(
      pageController: pageController,
      cartModel: widget.cartModel,
      totalAmount: widget.totalAmount,
      totalWeigth: widget.totalWeigth,
    ),
    SelectCart(
      totalAmount: widget.totalAmount,
      pageController: pageController,
      cartModel: widget.cartModel,
    ),
    const Congratulations(),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listPages.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 27.h, bottom: 45.h, left: 25.5.w, right: 16.w),
              child: Row(
                children: [
                  const Spacer(),
                  index != 6
                      ? Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 7.5.w),
                              child: CustomText(
                                title: 'Оформление заказа',
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: CustomText(
                                title: 'Отмена',
                                color: ColorStyles.accentColor,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
            listPages[index],
          ],
        );
      },
    );
  }
}
