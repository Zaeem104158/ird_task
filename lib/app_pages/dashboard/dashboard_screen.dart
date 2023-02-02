import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ird_task/app_pages/home/home_page.dart';
import 'package:ird_task/app_pages/record/record_page.dart';
import 'package:ird_task/app_pages/save/save_page.dart';
import 'package:ird_task/app_pages/search/search_page.dart';
import 'package:ird_task/app_pages/setting/setting_page.dart';
import 'package:ird_task/gen/assets.gen.dart';
import 'package:ird_task/utils/style.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key, int? selectedPage = 0}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int selectedPage = 0; //initial value

  final List<Widget> pages = [
    HomePage(),
    const SearchPage(),
    const RecordPage(),
    const SavedPage(),
    const SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedPage],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), // adjust to your liking
              topRight: Radius.circular(18.0), // adjust to your liking
            ),
            color: kWhiteColor, // put the color here
          ),
          child: BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            elevation: 8.0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            unselectedItemColor: kDisabledTextColor,
            selectedItemColor: kPrimaryColor,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: selectedPage,
            enableFeedback: false,

            items: [
              _bottomNavigationBarItem(
                  icon: selectedPage == 0
                      ? SvgPicture.asset(
                          Assets.icons.home,
                          color: kPrimaryColor,
                        )
                      : SvgPicture.asset(
                          Assets.icons.home,
                          color: kBottomBarDisableColor,
                        ),
                  label: 'Home'),
              _bottomNavigationBarItem(
                  icon: selectedPage == 1
                      ? SvgPicture.asset(
                          Assets.icons.search,
                          color: kPrimaryColor,
                        )
                      : SvgPicture.asset(
                          Assets.icons.search,
                          color: kBottomBarDisableColor,
                        ),
                  label: 'Search'),
              _bottomNavigationBarItem(
                  icon: selectedPage == 2
                      ? SvgPicture.asset(Assets.icons.video,
                          color: kPrimaryColor)
                      : SvgPicture.asset(
                          Assets.icons.video,
                          color: kBottomBarDisableColor,
                        ),
                  label: 'Record'),
              _bottomNavigationBarItem(
                  icon: selectedPage == 3
                      ? SvgPicture.asset(Assets.icons.save,
                          color: kPrimaryColor)
                      : SvgPicture.asset(
                          Assets.icons.save,
                          color: kBottomBarDisableColor,
                        ),
                  label: 'Saved'),
              _bottomNavigationBarItem(
                  icon: selectedPage == 4
                      ? SvgPicture.asset(Assets.icons.setting,
                          color: kPrimaryColor)
                      : SvgPicture.asset(
                          Assets.icons.setting,
                          color: kBottomBarDisableColor,
                        ),
                  label: 'Setting'),
            ],
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            },
            //onTap: (index) => dashController.selectedIndex = index,
          ),
        ));
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentindex,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kPrimaryColor,
          items: [
            BottomNavigationBarItem(
                backgroundColor: kPrimaryColor,
                label: "Home",
                icon: Image.asset(
                  "assets/icons/home.png",
                  height: 24,
                  width: 24,
                  color: Color(0xFF050C1F).withOpacity(0.5),
                ),
                //SvgPicture.asset(Assets.icons.homeIcon),
                activeIcon: Image.asset(
                  "assets/icons/home.png",
                  height: 24,
                  width: 24,
                  color: kPrimaryColor,
                ) /*SvgPicture.asset(
                  Assets.icons.homeIcon,
                )*/
            ),
            BottomNavigationBarItem(
              label: "Sponsors",
              icon: SvgPicture.asset(Assets.icons.sponsorsIcon),
              activeIcon: SvgPicture.asset(
                Assets.icons.sponsorsIcon,
                color: kPrimaryColor,
              ),
            ),
            BottomNavigationBarItem(
                label: "Messages",
                icon: SvgPicture.asset(Assets.icons.mail),
                activeIcon: SvgPicture.asset(
                  Assets.icons.mail,
                  color: kPrimaryColor,
                )),
            BottomNavigationBarItem(
                label: "More",
                icon: SvgPicture.asset(Assets.icons.moreIcon),
                activeIcon: SvgPicture.asset(
                  Assets.icons.moreIcon,
                  color: kPrimaryColor,
                )),
          ],
          onTap: (index) {

            jwt != null ?
            setState(() {
              _currentindex = index;
            }) : Get.to(() => LoginScreen(),
                transition:
                sendTransition);
          },
        ),
        body: pages[_currentindex]);
  }*/

  _bottomNavigationBarItem({Widget? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: icon!,
      ),
      label: label,
    );
  }
}
