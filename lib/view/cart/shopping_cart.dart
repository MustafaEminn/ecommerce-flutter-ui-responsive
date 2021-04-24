import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/base/state/base_state.dart';
import '../../core/components/appbars/appbar_cart.dart';
import '../../core/components/buttons/button_large_custom.dart';
import '../../core/components/texts/text_medium.dart';
import '../../core/components/texts/text_small.dart';
import '../../core/constants/app/app_constants.dart';
import '../../core/constants/component/button_constants.dart';
import '../../core/init/theme/colors.dart';

class ShoppingCartView extends StatefulWidget {
  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends BaseState<ShoppingCartView> {
  //SHOPPING CART ITEM BEGIN

  Widget shoppingCartItemImage(String photoName) {
    return Container(
      width: dynamicWidth(0.223),
      height: dynamicWidth(0.223),
      decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(ButtonConstants.BUTTON_BORDER_RADIUS)))),
      child: Center(
        child: Image.asset(
          ApplicationConstants.IMAGES_PATH + photoName,
          width: dynamicWidth(0.171),
        ),
      ),
    );
  }

  Widget shoppingCartItemTexts(String productName, int price) {
    return Container(
      width: dynamicWidth(0.574),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMedium(
            text: productName,
          ),
          SizedBox(
            height: dynamicHeight(0.0065),
          ),
          TextSmall(
            text: "USD " + price.toString(),
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }

  Widget counterDecrementButton() {
    return Container(
      width: dynamicWidth(0.0769),
      height: dynamicWidth(0.0769),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(ButtonConstants.BUTTON_BORDER_RADIUS))),
          border: Border.all(color: grey, width: 2)),
      child: Center(
        child: SvgPicture.asset(
          ApplicationConstants.SVG_PATH + "minus.svg",
          width: dynamicWidth(0.0512),
        ),
      ),
    );
  }

  Widget counterIncrementButton() {
    return Container(
      width: dynamicWidth(0.0769),
      height: dynamicWidth(0.0769),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(ButtonConstants.BUTTON_BORDER_RADIUS))),
          border: Border.all(color: grey, width: 2)),
      child: Center(
        child: SvgPicture.asset(
          ApplicationConstants.SVG_PATH + "plus.svg",
          width: dynamicWidth(0.0512),
        ),
      ),
    );
  }

  Widget shoppingCartCounterDelete() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: dynamicWidth(0.3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              counterIncrementButton(),
              TextMedium(
                text: "1",
              ),
              counterDecrementButton()
            ],
          ),
        ),
        SvgPicture.asset(
          ApplicationConstants.SVG_PATH + "trash-2.svg",
          width: dynamicWidth(0.0512),
        )
      ],
    );
  }

  Widget shoppingCartItem(String imageName, String productName, int price) {
    return Row(
      children: [
        shoppingCartItemImage(imageName),
        SizedBox(
          width: dynamicWidth(0.0384),
        ),
        Container(
          height: dynamicWidth(0.223),
          width: dynamicWidth(0.574),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shoppingCartItemTexts(productName, price),
              shoppingCartCounterDelete()
            ],
          ),
        )
      ],
    );
  }

  Widget shoppingCartItemContainer() {
    return Column(
      children: [
        shoppingCartItem("tma-2.webp", "TMA-2 Comfort Wireless", 270),
        SizedBox(
          height: dynamicHeight(0.0442),
        ),
        shoppingCartItem("cable.webp", "C02 - Cable", 25),
        SizedBox(
          height: dynamicHeight(0.0442),
        ),
      ],
    );
  }

  //SHOPPING CART ITEM END

  //TOTAL SECTION BEGIN

  Widget totalWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextSmall(
          text: "Total 2 Items",
          color: greyDark,
        ),
        TextMedium(
          text: "USD 295",
          weight: FontWeight.bold,
        )
      ],
    );
  }

  //TOTAL SECTION END

  //CHECKOUT BUTTON BEGIN

  Widget checkoutButton() {
    return ButtonLargeCustom(
        child: Container(
      width: dynamicWidth(0.682),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextSmall(
            text: "Proceed to Checkout",
            weight: FontWeight.bold,
            color: white,
          ),
          SvgPicture.asset(
            ApplicationConstants.SVG_PATH + "chevron-right.svg",
            width: dynamicWidth(0.0641),
            color: white,
          )
        ],
      ),
    ));
  }

  //CHECKOUT BUTTON END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBarCart(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.0615)),
          constraints: BoxConstraints(minHeight: dynamicSafeHeight(1)),
          child: Column(
            children: [
              SizedBox(
                height: dynamicHeight(0.0442),
              ),
              shoppingCartItemContainer(),
              Spacer(),
              totalWidget(),
              SizedBox(
                height: dynamicHeight(0.0315),
              ),
              checkoutButton(),
              SizedBox(
                height: dynamicHeight(0.0434),
              ),
            ],
          ),
        ));
  }
}
