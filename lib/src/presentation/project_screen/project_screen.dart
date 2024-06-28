import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:window_app/src/presentation/add_project_screen/add_project_screen.dart';
import 'package:window_app/src/presentation/share_screen/share_screen.dart';
import 'package:window_app/src/presentation/window_setting_view/window_setting_view.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Типовой проект',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              size: 18.sp,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShareScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 22.sp,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddProjectScreen(),
                  ));
            },
          ),
          PopupMenuButton<String>(
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
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        padding: EdgeInsets.all(2.w),
        children: List.generate(2, (index) {
          return _buildProjectCard(index + 1, context);
        }),
      ),
    );
  }

  Widget _buildProjectCard(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WindowSettingView(),
            ));
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/window.png',
                  height: 12.h,
                ),
              ),
              SizedBox(height: 0.5.h),
              Row(
                children: [
                  Text(
                    ' $index',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xFF757575),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '             1500×1200\n              sКол-во: 2',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
