import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/widgets/base_widget.dart';
import '../../../core/components/appbars/appbar_base.dart';
import '../../../core/components/buttons/button_text.dart';
import '../../../core/components/card/card_large.dart';
import '../../../core/components/card/gray_card.dart';
import '../../../core/components/lists/products_fit_horizontal_list.dart';
import '../../../core/components/lists/products_horizontal_list.dart';
import '../../../core/components/textfields/search_input.dart';
import '../../../core/components/texts/text_large.dart';
import '../../../core/components/texts/text_medium.dart';
import '../../../core/components/texts/text_s_large.dart';
import '../../../core/components/texts/text_small.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/constants/component/card_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/theme/colors.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  bool inputFocusEmail = false;
  int productsListSelectedIndex = 0;
  int _productLargeCardHorizontalSnapListIndex = 0;

  void routeAtExploreProductsView() {
    NavigationService.instance.navigateToPage(path: "/explore-products");
  }

  void routeAtProductDetailsView() {
    NavigationService.instance.navigateToPage(path: "/product-details");
  }

  Widget headerText() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: dynamicWidth(0.062)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMedium(
            text: "Hi, Andrea",
          ),
          SizedBox(
            height: dynamicHeight(0.0066),
          ),
          Container(
            width: dynamicWidth(0.85),
            child: TextLarge(
              weight: FontWeight.bold,
              text: "What are you looking for today?",
            ),
          )
        ],
      ),
    );
  }

  //LARGE CARD BEGIN

  Widget productLargeCardHeaderText() {
    return Container(
        padding: EdgeInsets.only(
            left: dynamicWidth(0.0615), top: dynamicHeight(0.0263)),
        width: dynamicWidth(0.387),
        child: TextSLarge(
          text: "TMA-2 Modular Headphone",
          weight: FontWeight.bold,
        ));
  }

  Widget productLargeCardBottomText() {
    return Container(
        padding: EdgeInsets.only(
            left: dynamicWidth(0.0615), top: dynamicHeight(0.0263)),
        width: dynamicWidth(0.387),
        child: Row(
          children: [
            ButtonText(
              text: "Shop Now",
              iconName: "arrow-right.svg",
            ),
          ],
        ));
  }

  Widget productLargeCardImage() {
    return Image.asset(
      ApplicationConstants.IMAGES_PATH + "tma-2.webp",
      width: dynamicWidth(0.3),
    );
  }

  Widget productLargeCard() {
    return InkWell(
      onTap: routeAtExploreProductsView,
      child: CardLarge(
          child: Row(
        children: [
          Column(
            children: [
              productLargeCardHeaderText(),
              productLargeCardBottomText()
            ],
          ),
          SizedBox(
            width: dynamicWidth(0.07),
          ),
          productLargeCardImage()
        ],
      )),
    );
  }

  Widget productLargeCardHorizontalSnapList() {
    return Container(
      height: dynamicWidth(CardConstants.LARGE_CARD_HEIGHT),
      child: PageView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        controller: PageController(
            viewportFraction: CardConstants.LARGE_CARD_WIDTH - 0.06),
        onPageChanged: (int index) =>
            setState(() => _productLargeCardHorizontalSnapListIndex = index),
        itemBuilder: (_, i) {
          return Transform.scale(
              scale: i == _productLargeCardHorizontalSnapListIndex ? 1 : 0.9,
              child: productLargeCard());
        },
      ),
    );
  }

  // LARGE CARD END

  //FEATURED HEADER BEGIN
  Widget featuredHeaderContainer() {
    return Container(
      width: dynamicWidth(CardConstants.LARGE_CARD_WIDTH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextMedium(text: "Featured Products"),
          InkWell(
            onTap: routeAtExploreProductsView,
            child: TextSmall(
              text: "See all",
              color: greyDark,
            ),
          )
        ],
      ),
    );
  }
  //FEATURED HEADER END

  Widget productsContainer() {
    return GrayCard(
      child: Column(
        children: [
          SizedBox(
            height: dynamicHeight(0.042),
          ),
          ProductsHorizontalList(),
          SizedBox(
            height: dynamicHeight(0.0263),
          ),
          productLargeCardHorizontalSnapList(),
          SizedBox(
            height: dynamicHeight(0.0263),
          ),
          featuredHeaderContainer(),
          SizedBox(
            height: dynamicHeight(0.0263),
          ),
          ProductFitHorizontalList()
        ],
      ),
    );
  }

  Widget upColumn() {
    return Column(
      children: [
        SizedBox(
          height: dynamicHeight(0.038),
        ),
        headerText(),
        SizedBox(
          height: dynamicHeight(0.038),
        ),
        SearchInput(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            NavigationService.instance.navigateToPage(path: "/search");
          },
          placeholder: "Search headphone",
        ),
        SizedBox(
          height: dynamicHeight(0.0328),
        ),
      ],
    );
  }

  Widget bottomColumn() {
    return Column(
      children: [
        productsContainer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBarBase(),
      body: BaseView(
        scrollPhysics: ClampingScrollPhysics(),
        onPageBuilder: (context) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: dynamicSafeHeight(1)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [upColumn(), bottomColumn()],
            ),
          );
        },
      ),
    );
  }
}
