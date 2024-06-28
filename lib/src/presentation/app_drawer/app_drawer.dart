import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:window_app/src/presentation/calculation_screen/calculation_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          top: 5.h,
          left: 1.5.w,
        ),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF3C66F5),
                  radius: 4.h,
                  child: SvgPicture.asset(
                    'assets/icons/com.svg',
                    width: 7.w,
                    height: 7.w,
                  ),
                ),
                SizedBox(width: 2.w),
                Text(
                  'Window smart',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 19.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            _createDrawerItem(
              icon: Icons.attach_money,
              text: 'Расчёт',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalculationScreen(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              icon: Icons.language,
              text: 'Язык',
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.desktop_windows,
              text: 'Версия компьютера',
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.star,
              text: 'Оценка',
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.info,
              text: 'О нас',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  ListTile _createDrawerItem({
    required IconData icon,
    required String text,
    GestureTapCallback? onTap,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
            size: 4.h,
          ),
          SizedBox(width: 2.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 17.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
