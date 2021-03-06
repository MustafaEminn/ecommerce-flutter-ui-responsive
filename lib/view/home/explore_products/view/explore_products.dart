import 'package:ecommerceflutterapp/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/widgets/base_widget.dart';
import '../../../../core/components/appbars/appbar_back_cart.dart';
import '../../../../core/components/buttons/button_filter.dart';
import '../../../../core/components/buttons/button_large.dart';
import '../../../../core/components/buttons/chips_button_small.dart';
import '../../../../core/components/card/card_small.dart';
import '../../../../core/components/card/gray_card.dart';
import '../../../../core/components/lists/products_horizontal_list.dart';
import '../../../../core/components/rating/star_rating_filled.dart';
import '../../../../core/components/textfields/double_input.dart';
import '../../../../core/components/texts/text_large.dart';
import '../../../../core/components/texts/text_medium.dart';
import '../../../../core/components/texts/text_small.dart';
import '../../../../core/components/texts/text_x_small.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/component/button_constants.dart';
import '../../../../core/init/theme/colors.dart';

class ExploreProductsView extends StatefulWidget {
  @override
  _ExploreProductsViewState createState() => _ExploreProductsViewState();
}

class _ExploreProductsViewState extends BaseState<ExploreProductsView> {
  List<Widget> listWidgets = [];
  int selectedFilterChipsIndex = 0;

  void routeAtProductDetailsView() {
    NavigationService.instance.navigateToPage(path: "/product-details");
  }

  //HEADER TEXTS BEGIN
  Widget productTypeText() {
    return TextMedium(text: "Headphone");
  }

  Widget productModelText() {
    return TextLarge(
      text: "TMA Wireless",
      weight: FontWeight.bold,
    );
  }

  Widget headerTextContainer() {
    return Container(
      padding: EdgeInsets.only(left: dynamicWidth(0.0641)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [productTypeText(), productModelText()],
      ),
    );
  }
  //HEADER TEXTS END

  //HORIZONTAL SCROLL BEGIN
  Widget startEndMargin() {
    return SizedBox(
      width: dynamicWidth(0.0615),
    );
  }

  Widget betweenMargin() {
    return SizedBox(
      width: dynamicWidth(0.0538),
    );
  }

  void listWidgetsAdd() {
    listWidgets = [
      startEndMargin(),
      ButtonFilter(
        onTap: openBottomFilterModal,
      ),
      betweenMargin(),
      Container(
          alignment: Alignment.center, child: TextMedium(text: "Popularity")),
      betweenMargin(),
      Container(alignment: Alignment.center, child: TextMedium(text: "Newest")),
      betweenMargin(),
      Container(
          alignment: Alignment.center,
          child: TextMedium(text: "Most Expensive")),
      startEndMargin()
    ];
  }

  Widget listHorizontal() {
    listWidgetsAdd();
    return Container(
      height: dynamicHeight(ButtonConstants.FILTER_BUTTON_HEIGHT),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return listWidgets[index];
        },
        itemCount: listWidgets.length,
      ),
    );
  }

  //HORIZONTAL SCROLL END
  //
  //FILTER MODAL BEGIN

  Widget filterModalHeader() {
    return Container(
        width: dynamicWidth(0.838),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextLarge(
              text: "Filter",
              weight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                ApplicationConstants.SVG_PATH + "x.svg",
                width: dynamicWidth(0.0715),
              ),
            )
          ],
        ));
  }

  Widget filterModalSectionHeader(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: dynamicWidth(0.0615)),
      child: TextMedium(
        text: text,
      ),
    );
  }

  List<String> chipsButtonsList = [
    "Popularity",
    "Newest",
    "Oldest",
    "High Price",
    "Low Price",
    "Review"
  ];

  Widget filterModalSortChipsItem(String buttonText, int index) {
    return Padding(
      padding: EdgeInsets.only(
          right: dynamicWidth(0.0307), bottom: dynamicWidth(0.0307)),
      child: ChipsSmallButton(
          selected: selectedFilterChipsIndex == index ? true : false,
          buttonText: buttonText),
    );
  }

  Widget filterModalSortChips() {
    return Container(
      alignment: Alignment.centerLeft,
      width: dynamicWidth(0.838),
      child: StatefulBuilder(
        builder: (context, _setState) {
          return Wrap(
            children: [
              for (int index = 0; index <= chipsButtonsList.length - 1; index++)
                GestureDetector(
                    onTap: () {
                      _setState(() {
                        selectedFilterChipsIndex = index;
                      });
                    },
                    child: filterModalSortChipsItem(
                        chipsButtonsList[index], index))
            ],
          );
        },
      ),
    );
  }

  Widget filterModalContainer() {
    return Container(
      height: dynamicHeight(0.72),
      child: Column(
        children: [
          SizedBox(
            height: dynamicHeight(0.0315),
          ),
          filterModalHeader(),
          SizedBox(
            height: dynamicHeight(0.0460),
          ),
          filterModalSectionHeader("Category"),
          SizedBox(
            height: dynamicHeight(0.0131),
          ),
          ProductsHorizontalList(),
          SizedBox(
            height: dynamicHeight(0.0460),
          ),
          filterModalSectionHeader("Sort by"),
          SizedBox(
            height: dynamicHeight(0.0131),
          ),
          filterModalSortChips(),
          SizedBox(
            height: dynamicHeight(0.0460),
          ),
          filterModalSectionHeader("Price Range"),
          SizedBox(
            height: dynamicHeight(0.0131),
          ),
          DoubleInput(
            placeholder1: "Min Price",
            keyboardType1: TextInputType.number,
            placeholder2: "Max Price",
            keyboardType2: TextInputType.number,
          ),
          SizedBox(
            height: dynamicHeight(0.0460),
          ),
          ButtonLarge(
              onTap: () {
                Navigator.pop(context);
              },
              text: "Apply Filter")
        ],
      ),
    );
  }

  Future<void> openBottomFilterModal() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(dynamicWidth(0.0769)),
            topRight: Radius.circular(dynamicWidth(0.0769))),
      ),
      builder: (BuildContext context) {
        return filterModalContainer();
      },
    );
  }

  //FILTER MODAL END

  //BOTTOM GRAY CARD BEGIN

  Widget grayCardItem() {
    return GestureDetector(
      onTap: routeAtProductDetailsView,
      child: CardSmall(
          child: Container(
              padding: EdgeInsets.all(dynamicWidth(0.0384)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      ApplicationConstants.IMAGES_PATH + "tma-2.webp",
                      width: dynamicWidth(0.320),
                    ),
                  ),
                  SizedBox(
                    height: dynamicHeight(0.0263),
                  ),
                  TextMedium(
                    text: "TMA-2 HD Wireless",
                  ),
                  TextSmall(
                    text: "USD 350",
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: dynamicHeight(0.0131),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          StarFilledRating(),
                          TextXSmall(text: "4.6"),
                          SizedBox(
                            width: dynamicWidth(0.0256),
                          ),
                          TextXSmall(text: "86 Reviews"),
                        ],
                      ),
                      SvgPicture.asset(
                        ApplicationConstants.SVG_PATH + "more-vertical.svg",
                        width: dynamicWidth(0.0512),
                      )
                    ],
                  ),
                ],
              ))),
    );
  }

  Widget grayCardContainer() {
    return GrayCard(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.045)),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          SizedBox(
            height: dynamicHeight(0.0315),
          ),
          Wrap(
            spacing: dynamicWidth(0.05),
            runSpacing: dynamicWidth(0.05),
            children: [
              for (var index = 0; index <= 8; index++) grayCardItem(),
            ],
          ),
          SizedBox(
            height: dynamicHeight(0.0315),
          ),
        ],
      ),
    ));
  }

  //BOTTOM GRAY CARD END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBarBackCart(),
      body: BaseView(
        scrollPhysics: ClampingScrollPhysics(),
        onPageBuilder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerTextContainer(),
            SizedBox(
              height: dynamicHeight(0.0263),
            ),
            listHorizontal(),
            SizedBox(
              height: dynamicHeight(0.0460),
            ),
            grayCardContainer()
          ],
        ),
      ),
    );
  }
}
