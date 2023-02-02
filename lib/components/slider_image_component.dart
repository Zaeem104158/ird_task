// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:ifix_mobile/base/base_state.dart';
// import 'package:ifix_mobile/components/text_component.dart';
// import 'package:ifix_mobile/gen/assets.gen.dart';
// import 'package:ifix_mobile/utils/size_config.dart';
// import 'package:ifix_mobile/utils/style.dart';


// class SliderImageComponent extends StatefulWidget {
//   const SliderImageComponent({Key? key}) : super(key: key);

//   @override
//   State<SliderImageComponent> createState() => _SliderImageComponentState();
// }

// class _SliderImageComponentState extends BaseState<SliderImageComponent> {


//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CampaignController>(builder: (controller) {

//       return Column(children: [
//         Container(
//           color: kPrimaryColor,
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 top: 16.0, left: 16, right: 16, bottom: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 hasText(controller.campaignDetailPropertyName.value)
//                     ? TextComponent(
//                         controller.campaignDetailPropertyName
//                             .toString()
//                             .capitalizeString(),
//                         font: latoFont,
//                         isTranslatable: false,
//                         fontWeight: regularFontWeight,
//                         fontSize: memberNameFontSize,
//                         padding: const EdgeInsets.only(bottom: 8),
//                         color: kWhiteColor)
//                     : hasText(controller.campaignDetailPropertyStreetNumber
//                                     .value) ==
//                                 true &&
//                             hasText(controller
//                                     .campaignDetailPropertyStreetAddress
//                                     .value) ==
//                                 true
//                         ? TextComponent(
//                             "${controller.campaignDetailPropertyStreetNumber.toString().capitalizeString()},"
//                             "${controller.campaignDetailPropertyStreetAddress.toString().capitalizeString()}",
//                             font: latoFont,
//                             isTranslatable: false,
//                             fontWeight: regularFontWeight,
//                             fontSize: memberNameFontSize,
//                             padding: const EdgeInsets.only(bottom: 8),
//                             color: kWhiteColor)
//                         : const TextComponent(
//                             "Property name, address isn't found",
//                             font: latoFont,
//                             isTranslatable: false,
//                             fontWeight: regularFontWeight,
//                             fontSize: memberNameFontSize,
//                             padding: EdgeInsets.only(bottom: 8),
//                             color: kWhiteColor),
//                 hasText(controller.campaignDetailPropertyStatus.value) ==
//                             true &&
//                         hasText(controller.campaignDetailPropertyOwner.value) ==
//                             true
//                     ? Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(010),
//                               color: kSecondaryGreenColor,
//                               border: Border.all(
//                                   color: kChipConnectedStatusBorderColor,
//                                   width: 1),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.zero,
//                               child: TextComponent(
//                                   controller.campaignDetailPropertyStatus
//                                       .toString()
//                                       .capitalizeFirst,
//                                   color: kChipConnectedStatusBorderColor,
//                                   font: latoFont,
//                                   padding: const EdgeInsets.only(
//                                       left: 16, right: 16, top: 2, bottom: 4),
//                                   fontWeight: mediumFontWeight,
//                                   fontSize: smallestFontSize,
//                                   letterSpacing: kSmallerLetterSpacing),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 0),
//                             child: TextComponent(
//                                 "Owner: ${controller.campaignDetailPropertyOwner.toString().capitalizeString()}",
//                                 color: kWhiteColor,
//                                 font: latoFont,
//                                 padding: const EdgeInsets.only(left: 12),
//                                 fontWeight: mediumFontWeight,
//                                 fontSize: smallestFontSize,
//                                 letterSpacing: kMediumSmallLetterSpacing),
//                           )
//                         ],
//                       )
//                     : const SizedBox(),
//               ],
//             ),
//           ),
//         ),
//         Stack(
//           children: [
//             hasText(controller.campaignDetailPropertyImage.value) == true
//                 ? Stack(
//                     children: [
//                       CachedNetworkImage(
//                           imageUrl:
//                               controller.campaignDetailPropertyImage.toString(),
//                           color: Colors.black.withOpacity(0.2),
//                           colorBlendMode: BlendMode.darken,
//                           progressIndicatorBuilder:
//                               (context, url, downloadProgress) => SizedBox(
//                                   height: 50,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(16.0),
//                                     child: Center(
//                                       child: CircularProgressIndicator(
//                                           value: downloadProgress.progress,
//                                           color: kPrimaryColor),
//                                     ),
//                                   )),
//                           width: SizeConfig.getScreenWidth(context),
//                           fit: BoxFit.fill),
//                       Positioned(
//                           top: 20,
//                           right: 16,
//                           child: SvgPicture.asset(Assets.icons.star))
//                     ],
//                   )
//                 : Stack(
//                     children: [
//                       Image(
//                         image: const AssetImage(
//                             "assets/images/campaign_place_holder.png"),
//                         color: Colors.black.withOpacity(0.2),
//                         colorBlendMode: BlendMode.darken,
//                         width: SizeConfig.getScreenWidth(context),
//                         fit: BoxFit.fill,
//                       ),
//                       Positioned(
//                           top: 20,
//                           right: 16,
//                           child: SvgPicture.asset(Assets.icons.star))
//                     ],
//                   ),
//             controller.campaignDetailPropertyType.value == sale
//                 ? Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Container(
//                       width: 76,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           color: kFilterResetColor,
//                           borderRadius: BorderRadius.circular(20)),

//                       child: TextComponent(
//                         sale.toString().capitalizeFirst,
//                         color: Colors.white,
//                         textAlign: TextAlign.center,
//                         padding: const EdgeInsets.only(top: 5),
//                       ),
//                       //backgroundColor: kFilterResetColor,
//                     ),
//                   )
//                 : controller.campaignDetailPropertyType.value == lease
//                     ? Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Container(
//                           width: 76,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               color: kChipStatusBorderColor,
//                               borderRadius: BorderRadius.circular(20)),
//                           child: TextComponent(
//                             lease.capitalizeFirst,
//                             color: Colors.white,
//                             textAlign: TextAlign.center,
//                             padding: const EdgeInsets.only(top: 5),
//                           ),
//                         ))
//                     : controller.campaignDetailPropertyType.value != null
//                         ? Padding(
//                             padding: const EdgeInsets.only(left: 8.0, top: 8.0),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   width: 76,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                       color: kFilterResetColor,
//                                       borderRadius: BorderRadius.circular(20)),
//                                   child: TextComponent(sale.capitalizeFirst,
//                                       color: Colors.white,
//                                       textAlign: TextAlign.center,
//                                       padding: const EdgeInsets.only(top: 5.0)),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   width: 76,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//                                       color: kChipStatusBorderColor,
//                                       borderRadius: BorderRadius.circular(20)),
//                                   child: TextComponent(lease.capitalizeFirst,
//                                       color: Colors.white,
//                                       textAlign: TextAlign.center,
//                                       padding: const EdgeInsets.only(top: 5.0)),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : const SizedBox(),
//           ],
//         ),
//       ]);
//     });
//   }
// }

// bool hasText(String? text) {
//   if (text == null || text.isEmpty) {
//     return false;
//   } else {
//     return true;
//   }
// }

// extension StringExtension on String {
//   String capitalizeString() {
//     return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
//   }
// }
