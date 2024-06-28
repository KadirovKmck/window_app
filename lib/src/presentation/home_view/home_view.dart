import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:window_app/src/presentation/new_project_page/new_project_page.dart';
import 'package:window_app/src/presentation/app_drawer/app_drawer.dart';
import 'package:window_app/src/presentation/project_screen/project_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  return TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Искать',
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                      ),
                      fillColor: const Color(0xFFEBEBEB),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 2.9.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 13.w,
                    height: 6.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3C66F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProjectScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 6.h,
                        padding: EdgeInsets.only(top: 2.h, left: 3.w),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF3C66F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Типовой проект',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 13.w,
                    height: 6.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3C66F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Container(
                      height: 6.h,
                      padding: EdgeInsets.only(top: 2.h, left: 3.w),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF3C66F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Типовой проект',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewProjectPage(),
              ),
            );
          },
          child: Container(
            height: 15.h,
            width: 15.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF3C66F5),
            ),
            child: Icon(
              Icons.add,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
