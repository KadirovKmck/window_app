import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarAction extends StatelessWidget {
  final String iconPath;

  const AppBarAction({required this.iconPath, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: SvgPicture.asset(
          iconPath,
          height: 2.7.h,
          width: 2.7.h,
        ),
      ),
    );
  }
}

class AppBarIconButton extends StatelessWidget {
  final IconData icon;

  const AppBarIconButton({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 22.sp),
      onPressed: () {},
    );
  }
}

class AppBarPopupMenu extends StatelessWidget {
  const AppBarPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      onSelected: (value) {},
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'edit',
            child: Text(
              'Редактирование проекта',
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
          PopupMenuItem<String>(
            value: 'delete',
            child: Text(
              'Удалить проект',
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
          PopupMenuItem<String>(
            value: 'summary',
            child: Text(
              'Резюме проекта',
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
          PopupMenuItem<String>(
            value: 'price',
            child: Text(
              'Цена',
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
        ];
      },
    );
  }
}