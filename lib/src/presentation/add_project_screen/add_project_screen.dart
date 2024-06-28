import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  String selectedType = 'Створный';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Добавить',
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Radio<String>(
                  activeColor: const Color(0xFF3C66F5),
                  value: 'Створный',
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
                Text(
                  'Створный',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(width: 3.w),
                Radio<String>(
                  activeColor: const Color(0xFF3C66F5),
                  value: 'Раздвижение',
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                ),
                Text(
                  'Раздвижение',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ширина',
              ),
            ),
            SizedBox(height: 2.h),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Высота',
              ),
            ),
            SizedBox(height: 2.h),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Количество',
              ),
            ),
            const Spacer(),
            Container(
              height: 6.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF3C66F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  'Сохранить',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
