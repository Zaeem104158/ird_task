import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ird_task/components/button_component.dart';
import 'package:ird_task/components/image_view_component.dart';
import 'package:ird_task/components/text_component.dart';
import 'package:ird_task/gen/assets.gen.dart';
import 'package:ird_task/utils/size_config.dart';
import 'package:ird_task/utils/style.dart';
import 'dart:math' as math;

class CustomeCardComponent extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final String? title;
  final Color titleColor;
  final Color subTitleColor;
  final String? subTitle;
  final bool? isWatchButtonExist;
  final String? cardLogo;
  final double cardBorderRadius;
  final Color cardBorderColor;
  final String? isButtonExistText;
  final String? isButtonPrefixIcon;
  final String? leadingCardIcon;
  final bool isLeadingCardIconOnTopExist;
  final bool isLocalAsset;
  final EdgeInsets titlePadding;
  final EdgeInsets subTitlePadding;
  const CustomeCardComponent({
    Key? key,
    this.padding = const EdgeInsets.fromLTRB(15, 24, 15, 24),
    this.height,
    this.width,
    this.backgroundColor,
    this.cardBorderRadius = 8.0,
    this.title,
    this.subTitle,
    this.titleColor = kWhiteColor,
    this.subTitleColor = kWhiteColor,
    this.titlePadding = const EdgeInsets.all(15),
    this.subTitlePadding = const EdgeInsets.all(15),
    this.isWatchButtonExist = false,
    this.cardLogo,
    this.cardBorderColor = kGrayColor,
    this.isButtonExistText = "",
    this.isButtonPrefixIcon,
    this.isLeadingCardIconOnTopExist = false,
    this.leadingCardIcon,
    this.isLocalAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    int x = 1;
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
              isLeadingCardIconOnTopExist == true
                  ? Icon(
                      Icons.today_outlined,
                      size: 45,
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0),
                    )
                  // ImageViewComponent(
                  //     imageUrl: leadingCardIcon,
                  //     isLocalAssetSvg: isLocalAsset,
                  //     height: 70,
                  //     width: 70,
                  //     imageRadius: 0,
                  //     boxFit: BoxFit.fill,
                  //     //isLocalAssetSvgColor: Colors.red,
                  //   )
                  : const SizedBox(
                      height: 0,
                    ),
              TextComponent(
                title,
                isTranslatable: false,
                textAlign: TextAlign.start,
                padding: titlePadding,
                color: titleColor,
                font: interFont,
                fontWeight: titleFontWeight,
                fontSize: noDataFoundRegularFontSize,
                lineHeight: k17LineHeight,
              ),
              TextComponent(
                subTitle,
                isTranslatable: false,
                textAlign: TextAlign.start,
                padding: subTitlePadding,
                color: subTitleColor.withOpacity(0.7),
                font: interFont,
                fontWeight: regularFontWeight,
                fontSize: smallerFontSize,
                lineHeight: k23LineHeight,
              ),
              isWatchButtonExist == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonComponent(
                          text: isButtonExistText,
                          isTranslate: false,
                          onPressed: () {},
                          borderColor: kSubTitleTextColor,
                          borderRadius: 70,
                          textColor: kWhiteColor,
                          buttonColor:
                              kProfileCircleAvaterBorderColor.withOpacity(0.6),
                          width: SizeConfig.getScreenWidth(context) / 2.5,
                          padding: const EdgeInsets.all(15),
                          stylePadding: const EdgeInsets.all(10),
                          fontSize: noDataFoundRegularFontSize,
                          fontWeight: titleFontWeight,
                          isLocalAssetSvg: true,
                          prefixImageUrl: isButtonPrefixIcon,
                          prefixIconWidth: 12,
                          prefixIconHeight: 12,
                        ),
                        ImageViewComponent(
                          imageUrl: cardLogo,
                          placeHolderIcon: Assets.images.placeHolderIcon.path,
                          height: 75,
                          width: 80,
                          borderColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          backgroundRadius: 0.0,
                          boxFit: BoxFit.fill,
                          isLocalAsset: true,
                        )
                      ],
                    )
                  : const SizedBox(),
            ],
          )),
    );
  }
}
