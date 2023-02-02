import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ird_task/components/image_view_component.dart';
import 'package:ird_task/components/text_component.dart';
import 'package:ird_task/gen/assets.gen.dart';
import 'package:ird_task/utils/size_config.dart';
import 'package:ird_task/utils/style.dart';

class CustomeAppbarComponent extends StatelessWidget {
  final String? font;
  final double? appBarTitleFontSize;
  final FontWeight appBarTitleFontWeight;
  final double? appBarTitleLineHeight;
  final double? appBarTitleLetterSpacing;
  final double? appBarSubTitleFontSize;
  final FontWeight appBarSubTitleFontWeight;
  final double? appBarSubTitleLineHeight;
  final double? appBarSubTitleLetterSpacing;
  final EdgeInsets padding;
  final String? appBarTitle;
  final String? appBarSubTitle;
  final String? appBarPreFixIcon;
  final String? profileImage;
  final String? placeHolderIcon;
  const CustomeAppbarComponent(
      {super.key,
      this.padding = const EdgeInsets.fromLTRB(48, 24, 48, 24),
      this.appBarTitle,
      this.appBarSubTitle,
      this.appBarPreFixIcon,
      this.font = interFont,
      this.appBarTitleFontSize = 16,
      this.appBarTitleFontWeight = regularFontWeight,
      this.appBarTitleLineHeight = 1.0,
      this.appBarTitleLetterSpacing = 12,
      this.appBarSubTitleFontSize = 16,
      this.appBarSubTitleFontWeight = regularFontWeight,
      this.appBarSubTitleLineHeight = 1.0,
      this.appBarSubTitleLetterSpacing = 12,
      this.profileImage,
      this.placeHolderIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: SizeConfig.getScreenHeight(context) / 14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent(
                  appBarTitle,
                  padding: EdgeInsets.zero,
                  color: kWhiteColor,
                  font: font ?? interFont,
                  fontSize: appBarTitleFontSize,
                  fontWeight: appBarTitleFontWeight,
                  lineHeight: appBarSubTitleLineHeight,
                  letterSpacing: appBarSubTitleLetterSpacing,
                  textAlign: TextAlign.start,
                  isTranslatable: false,
                ),
                TextComponent(
                  appBarSubTitle,
                  padding: EdgeInsets.zero,
                  color: kWhiteColor,
                  font: font ?? interFont,
                  fontSize: appBarSubTitleFontSize,
                  fontWeight: appBarSubTitleFontWeight,
                  lineHeight: appBarSubTitleLineHeight,
                  letterSpacing: appBarSubTitleLetterSpacing,
                  textAlign: TextAlign.start,
                  isTranslatable: false,
                ),
              ],
            ),
            (profileImage != null || profileImage != "")
                ? ImageViewComponent(
                    imageUrl: profileImage,
                    placeHolderIcon: placeHolderIcon!,
                    borderColor: kProfileCircleAvaterBorderColor,
                    isLocalAsset: true,
                    boxFit: BoxFit.fill,
                    imageRadius: 50,
                    width: 40.0,
                    height: 40.0,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
