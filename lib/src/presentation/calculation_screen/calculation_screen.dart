import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CalculationScreen extends StatelessWidget {
  const CalculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '     Расчёт',
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: ListView(
          children: [
            _buildSectionTitle('НПВХ Профили (m)'),
            _buildTextField('Рама'),
            _buildTextField('Средник'),
            _buildTextField('Оконная рама'),
            _buildTextField('Дверной пояс'),
            _buildTextField('Раздвижная рама'),
            _buildTextField('Раздвижная лента'),
            SizedBox(height: 2.h),
            _buildSectionTitle('Алюминиевые профили (m)'),
            _buildTextField('Рама'),
            _buildTextField('Средник'),
            _buildTextField('Оконная рама'),
            _buildTextField('Дверной пояс'),
            _buildTextField('Раздвижная рама'),
            _buildTextField('Раздвижная лента'),
            SizedBox(height: 2.h),
            _buildSectionTitle('Аксессуары (кол-во)'),
            _buildTextField('Поворот'),
            _buildTextField('Наклон и поворот'),
            _buildTextField('Наклон'),
            _buildTextField('Дверь'),
            _buildTextField('Раздвижной'),
            SizedBox(height: 2.h),
            _buildSectionTitle('Стекло и панель (m²)'),
            _buildTextField('Стекло'),
            _buildTextField('НПВХ панель'),
            _buildTextField('Алюминиевая панель'),
            SizedBox(height: 2.h),
            _buildSectionTitle('НПВХ Профили (m)'),
            _buildTextField('Налог (%)'),
            _buildTextField('Валютный символ'),
            _buildTextField('Десятичные места'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.w),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: hint,
        ),
      ),
    );
  }
}
