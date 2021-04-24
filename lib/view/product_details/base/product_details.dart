import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/appbars/appbar_back_cart.dart';
import '../../../core/components/texts/text_custom.dart';
import '../../../core/components/texts/text_medium.dart';
import '../../../core/components/texts/text_x_large.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/init/theme/colors.dart';
import '../features/product_features.dart';
import '../overview/product_overview.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends BaseState<ProductDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  //TEXT HEADER BEGIN
  Widget priceText() {
    return TextMedium(
      text: "USD 350",
      weight: FontWeight.bold,
      color: primary,
    );
  }

  Widget productText() {
    return TextXLarge(
      text: "TMA-2 HD WIRELESS",
      weight: FontWeight.bold,
    );
  }

  Widget headerTextContainer() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: dynamicWidth(0.0615)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [priceText(), productText()],
      ),
    );
  }
  //TEXT HEADER END

  //TABBAR BEGIN

  Widget tabbarContainer() {
    return Container(
      alignment: Alignment.centerLeft,
      width: dynamicWidth(1),
      child: TabBar(
          controller: _tabController,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: dynamicWidth(0.01), color: primary),
              insets: EdgeInsets.symmetric(horizontal: dynamicWidth(0.116))),
          tabs: [
            Container(
              width: dynamicWidth(0.179),
              child: Tab(
                child: TextMedium(
                  text: "Overview",
                  color: black,
                ),
              ),
            ),
            Container(
              width: dynamicWidth(0.179),
              child: Tab(
                child: TextMedium(
                  text: "Features",
                  color: black,
                ),
              ),
            ),
            Container(
              width: dynamicWidth(0.256),
              child: Tab(
                child: TextCustom(
                  text: "Specification",
                  overflow: TextOverflow.ellipsis,
                  size: ApplicationConstants.TEXT_HEADER_M,
                  color: black,
                ),
              ),
            )
          ]),
    );
  }

  Widget tabbarView() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [ProductOverviewView(), ProductFeaturesView(), Container()],
    );
  }

  //TABBAR END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBarBackCart(),
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, boolean) {
          return [
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    SizedBox(
                      height: dynamicHeight(0.0236),
                    ),
                    headerTextContainer(),
                    SizedBox(
                      height: dynamicHeight(0.0384),
                    ),
                    tabbarContainer(),
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          child: tabbarView(),
        ),
      ),
    );
  }
}
