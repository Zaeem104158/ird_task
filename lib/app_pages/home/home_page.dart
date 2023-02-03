import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ird_task/components/custom_appbar_component.dart';
import 'package:ird_task/components/custome_card_component.dart';
import 'package:ird_task/components/custome_card_listing_component.dart';
import 'package:ird_task/components/custum_background_component.dart';
import 'package:ird_task/components/text_component.dart';
import 'package:ird_task/gen/assets.gen.dart';
import 'package:ird_task/model/todo_task_model.dart';
import 'package:ird_task/model/user_model.dart';
import 'package:ird_task/utils/size_config.dart';
import 'package:ird_task/utils/strings.dart';
import 'package:ird_task/utils/style.dart';

class HomePage extends StatelessWidget {
  // final Map<String, String> userInfo = {"userName": "Habib", "userImage": ""};

  final taskList = List.generate(20, (task) {
    return TodoTask(taskName: "Office Work", date: "12/2/2023");
  });
  User currentUser = User(
      name: "Zaeem", userProfileImage: Assets.images.userProfileImage.path);
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: <Widget>[
                //BackGround
                Positioned(
                  top: 0,
                  left: 0,
                  height: SizeConfig.getScreenHeight(context) / 2.0,
                  width: SizeConfig.getScreenWidth(context),
                  child: const CustomBackgroundComponent(
                    linearGradientColor: kPrimaryLinerColor,
                    bottomLeft: 20.0,
                    bottomRight: 20.0,
                  ),
                ),
                //Appbar
                Positioned(
                  top: 30,
                  left: 0,
                  height: SizeConfig.getScreenHeight(context) / 6.0,
                  width: SizeConfig.getScreenWidth(context),
                  child: CustomeAppbarComponent(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 36, bottom: 24),
                    appBarPreFixIcon: Assets.logos.handShake,
                    appBarTitle: "Hi, ${currentUser.name} 👋",
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
                    profileImage: currentUser.userProfileImage,
                    placeHolderIcon: Assets.images.placeHolderIcon.path,
                  ),
                ),
                //Video Card
                Positioned(
                  top: 100,
                  height: SizeConfig.getScreenHeight(context) / 3.5,
                  width: SizeConfig.getScreenWidth(context),
                  child: CustomeCardComponent(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 24, bottom: 24),
                    backgroundColor: kCardButtomBackgroundColor,
                    cardBorderColor: kCardButtomBackgroundColor,
                    cardBorderRadius: 15,
                    title: watchVideoTitle,
                    titlePadding: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 15),
                    subTitlePadding: const EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 0),
                    titleColor: kWhiteColor,
                    subTitle: watchVideoSubTitle,
                    subTitleColor: kWhiteColor,
                    isWatchButtonExist: true,
                    isButtonExistText: watchVideo,
                    isButtonPrefixIcon: Assets.icons.playIcon,
                    cardLogo: Assets.images.todoImage.path,
                  ),
                ),
                //Reminder task and see all row
                Positioned(
                  top: 320,
                  left: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TextComponent(
                        reminderTask,
                        padding: EdgeInsets.zero,
                        isTranslatable: false,
                        color: kWhiteColor,
                        font: interFont,
                        fontWeight: titleFontWeight,
                        fontSize: noDataFoundRegularFontSize,
                        textAlign: TextAlign.left,
                        lineHeight: k23LineHeight,
                      ),
                      SizedBox(
                        width: SizeConfig.getScreenWidth(context) / 1.9,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: TextComponent(
                          seeAll,
                          padding: EdgeInsets.zero,
                          isTranslatable: false,
                          color: kWhiteColor.withOpacity(
                            0.7,
                          ),
                          font: interFont,
                          fontWeight: regularFontWeight,
                          fontSize: smallerFontSize,
                          lineHeight: k19LineHeight,
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                ),
                //Vertical Scroll Reminder Work
                Positioned(
                    top: 350,
                    left: 0,
                    width: SizeConfig.getScreenWidth(context),
                    height: SizeConfig.getScreenHeight(context) / 8,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: taskList.length,
                        itemBuilder: (context, index) {
                          return CustomeCardComponent(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            backgroundColor: kWhiteColor,
                            title: taskList[index].taskName,
                            subTitle: "$saveDate : ${taskList[index].date}",
                            titleColor: kPrimaryColor,
                            subTitleColor: kPrimaryColor,
                            titlePadding: const EdgeInsets.only(
                                left: 5, right: 10, top: 0, bottom: 0),
                            subTitlePadding: const EdgeInsets.only(
                                left: 5, right: 10, top: 0, bottom: 0),
                            isLeadingCardIconOnTopExist: true,
                            isLocalAsset: true,
                            leadingCardIcon: Assets.icons.todoListIcon,
                          );
                        })),
                //All task and see all row
                Positioned(
                  top: 380,
                  left: 20.0,
                  width: SizeConfig.getScreenWidth(context),
                  height: SizeConfig.getScreenHeight(context) / 4.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TextComponent(
                          allTask,
                          padding: EdgeInsets.zero,
                          isTranslatable: false,
                          color: kPrimaryColor,
                          font: interFont,
                          fontWeight: titleFontWeight,
                          fontSize: noDataFoundRegularFontSize,
                          lineHeight: k23LineHeight,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          width: SizeConfig.getScreenWidth(context) / 1.53,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: TextComponent(
                            seeAll,
                            padding: EdgeInsets.zero,
                            isTranslatable: false,
                            color: kPrimaryColor.withOpacity(
                              0.7,
                            ),
                            font: interFont,
                            fontWeight: regularFontWeight,
                            fontSize: smallerFontSize,
                            lineHeight: k19LineHeight,
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //All tasks
                Positioned(
                    top: 480,
                    left: 0,
                    width: SizeConfig.getScreenWidth(context),
                    height: SizeConfig.getScreenHeight(context) / 3.5,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: taskList.length,
                        itemBuilder: (context, index) {
                          return CustomeCardListingComponent(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            backgroundColor: kWhiteColor,
                            title: "${taskList[index].taskName} $index",
                            subTitle: "$saveDate : ${taskList[index].date}",
                            titleColor: kPrimaryColor,
                            subTitleColor: kPrimaryColor,
                            titlePadding: const EdgeInsets.only(left: 15),
                            subTitlePadding: const EdgeInsets.only(left: 15),
                            isLeadingCardIconOnTopExist: true,
                            isLocalAsset: true,
                            leadingCardIcon: Assets.icons.todoListIcon,
                          );
                        })),
              ],
            )));
  }
}
