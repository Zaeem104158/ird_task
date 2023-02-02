import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ird_task/components/button_component.dart';
import 'package:ird_task/components/image_view_component.dart';
import 'package:ird_task/components/text_component.dart';
import 'package:ird_task/gen/assets.gen.dart';
import 'package:ird_task/utils/size_config.dart';
import 'package:ird_task/utils/style.dart';

class CustomeCardComponent extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final String? title;
  final String? subTitle;
  final bool? isWatchButtonExist;
  final String? cardLogo;
  final double cardBorderRadius;
  final Color cardBorderColor;
  final String? isButtonExistText;
  final Color isButtonExistTextColor;
  final Color isButtonExistBorderColor;
  final double isButtonExistBorderRadius;

  const CustomeCardComponent({
    Key? key,
    this.padding = const EdgeInsets.fromLTRB(15, 24, 15, 24),
    this.height,
    this.width,
    this.backgroundColor,
    this.cardBorderRadius = 8.0,
    this.title,
    this.subTitle,
    this.isWatchButtonExist = false,
    this.cardLogo,
    this.cardBorderColor = kGrayColor,
    this.isButtonExistText = "",
    this.isButtonExistBorderColor = kTextColor,
    this.isButtonExistBorderRadius = 8,
    this.isButtonExistTextColor = kGrayColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(cardBorderRadius)),
          border: Border.all(color: cardBorderColor, width: 2.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextComponent(
              title,
              padding: EdgeInsets.zero,
              font: interFont,
              fontSize: 8,
            ),
            TextComponent(
              subTitle,
              padding: EdgeInsets.zero,
              font: interFont,
              fontSize: 8,
            ),
            isWatchButtonExist == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonComponent(
                        text: isButtonExistText,
                        isTranslate: false,
                        onPressed: () {},
                        borderColor: isButtonExistBorderColor,
                        borderRadius: isButtonExistBorderRadius,
                        textColor: isButtonExistTextColor,
                        buttonColor: kCardButtomBackgroundColor,
                        width: 150,
                        padding: EdgeInsets.all(15),
                        stylePadding: EdgeInsets.zero,
                        fontSize: 15,
                        fontWeight: regularFontWeight,
                      ),
                      ImageViewComponent(
                        imageUrl: cardLogo,
                        placeHolderIcon: Assets.images.placeHolderIcon.path,
                        height: 60,
                        width: 60,
                        borderColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        backgroundRadius: 0.0,
                        boxFit: BoxFit.fill,
                        isLocalAsset: true,
                      )
                    ],
                  )
                //  Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: ButtonComponent(
                //           text: isButtonExistText,
                //           isTranslate: false,
                //           onPressed: () {},
                //           borderColor: isButtonExistBorderColor,
                //           borderRadius: isButtonExistBorderRadius,
                //           textColor: isButtonExistTextColor,
                //           buttonColor: kCardButtomBackgroundColor,
                //         ),
                //       ),
                //       // ImageViewComponent(
                //       //   imageUrl: cardLogo,
                //       //   placeHolderIcon: Assets.images.placeHolderIcon.path,
                //       //   height: 10,
                //       //   width: 10,
                //       // )
                //     ],
                //   )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
