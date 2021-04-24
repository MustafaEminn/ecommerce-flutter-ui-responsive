import 'package:flutter/material.dart';

import '../../core/base/state/base_state.dart';
import '../../core/base/widgets/base_widget.dart';
import '../../core/components/appbars/appbar_profile.dart';
import '../../core/components/avatars/avatar_large.dart';
import '../../core/components/texts/text_medium.dart';
import '../../core/components/texts/text_small.dart';
import '../../core/init/theme/colors.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView> {
  double leftPadding = 0.0615;
  //PROFILE INFO SECTION BEGIN
  Widget profileInfoTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextMedium(text: "Andrea Hirata"),
        SizedBox(
          height: dynamicHeight(0.00921),
        ),
        TextSmall(
          text: "hirata@gmail.com",
          color: greyDark,
        )
      ],
    );
  }

  Widget profileInfoContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(leftPadding)),
      child: Row(
        children: [
          AvatarLarge(),
          SizedBox(
            width: dynamicWidth(0.0666),
          ),
          profileInfoTexts()
        ],
      ),
    );
  }

  //PROFILE INFO SECTION END

  //SETTINGS LIST BEGIN

  Widget settingsHeaderText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dynamicWidth(leftPadding),
          vertical: dynamicHeight(0.0263)),
      child: TextSmall(
        text: text,
        color: greyDark,
      ),
    );
  }

  Widget settingsListItem(String listItemText) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: dynamicWidth(1),
            margin: EdgeInsets.symmetric(horizontal: dynamicWidth(leftPadding)),
            height: dynamicHeight(0.0657),
            child: TextMedium(text: listItemText),
          ),
          Divider(
            height: 0,
            indent: 0,
          )
        ],
      ),
    );
  }

  Widget settingsListContainer() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          settingsHeaderText("General"),
          settingsListItem("Edit Profile"),
          settingsListItem("Notifications"),
          settingsListItem("Wishlist"),
          settingsHeaderText("Legal"),
          settingsListItem("Terms of Use"),
          settingsListItem("Privacy Policy"),
          settingsHeaderText("Personal"),
          settingsListItem("Report a Bug"),
          settingsListItem("Logout"),
        ],
      ),
    );
  }

  //SETTINGS LIST END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBarProfile(),
        body: BaseView(onPageBuilder: (context) {
          return Container(
            child: Column(
              children: [
                SizedBox(
                  height: dynamicHeight(0.0394),
                ),
                profileInfoContainer(),
                SizedBox(
                  height: dynamicHeight(0.0328),
                ),
                Divider(
                  thickness: 2,
                ),
                settingsListContainer()
              ],
            ),
          );
        }));
  }
}
