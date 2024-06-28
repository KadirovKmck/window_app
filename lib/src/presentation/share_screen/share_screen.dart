import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  String selectedType = 'Створный';
  final TextEditingController _widthController = TextEditingController();

  @override
  void dispose() {
    _widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Выслать проект',
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            TextField(
              controller: _widthController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Наименование файла',
              ),
            ),
            SizedBox(height: 2.h),
            RadioListTile<String>(
              activeColor: const Color(0xFF3C66F5),
              title: const Text('PDF file (*.pdf)'),
              value: 'PDF file (*.pdf)',
              groupValue: selectedType,
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
            ),
            RadioListTile<String>(
              activeColor: const Color(0xFF3C66F5),
              title: const Text('iwindoor file (*.iwda)'),
              value: 'iwindoor file (*.iwda)',
              groupValue: selectedType,
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 6.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFF3C66F5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
