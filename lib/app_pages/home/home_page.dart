import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ird_task/components/custom_appbar_component.dart';
import 'package:ird_task/components/custome_card_component.dart';
import 'package:ird_task/components/custum_background_component.dart';
import 'package:ird_task/gen/assets.gen.dart';
import 'package:ird_task/utils/size_config.dart';
import 'package:ird_task/utils/style.dart';

class HomePage extends StatelessWidget {
  final Map<String, String> userInfo = {"userName": "Habib", "userImage": ""};
  HomePage({super.key});
  // final String? userName = "Habib";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackgroundComponent(
            height: SizeConfig.getScreenHeight(context) / 2.0,
            linearGradientColor: kPrimaryLinerColor,
            bottomLeft: 20.0,
            bottomRight: 20.0,
          ),
          CustomeAppbarComponent(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 36, bottom: 24),
            appBarPreFixIcon: Assets.logos.handShake,
            appBarTitle: "Hi, ${userInfo["userName"]} 👋",
            appBarSubTitle: "Let's explore your notes",
            font: interFont,
            appBarTitleFontSize: appBarFontSize,
            appBarTitleFontWeight: titleFontWeight,
            appBarTitleLineHeight: k23LineHeight,
            appBarTitleLetterSpacing: kSmallestLetterSpacing,
            appBarSubTitleFontSize: smallerFontSize,
            appBarSubTitleFontWeight: regularFontWeight,
            appBarSubTitleLetterSpacing: kSmallestLetterSpacing,
            appBarSubTitleLineHeight: k19LineHeight,
            profileImage: Assets.images.userProfileImage.path,
            placeHolderIcon: Assets.images.placeHolderIcon.path,
          ),
          Positioned(
            top: 100,
            child: CustomeCardComponent(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 24, bottom: 24),
              height: SizeConfig.getScreenHeight(context) / 6,
              width: SizeConfig.getScreenWidth(context) / 1.10,
              backgroundColor: kCardButtomBackgroundColor,
              cardBorderColor: kCardButtomBackgroundColor,
              cardBorderRadius: 15,
              title: "Welcome to TickTick Task",
              subTitle:
                  "Your one-stop app for task management. Simplify, track, and accomplish tasks with ease.",
              isWatchButtonExist: true,
              isButtonExistBorderColor: Colors.red,
              isButtonExistBorderRadius: 20,
              isButtonExistText: "Watch Video",
              isButtonExistTextColor: Colors.white,
              cardLogo: Assets.images.todoImage.path,
            ),
          )
        ],
      ),
    );
  }
}
