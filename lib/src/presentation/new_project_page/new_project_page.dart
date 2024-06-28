import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewProjectPage extends StatefulWidget {
  const NewProjectPage({super.key});

  @override
  State<NewProjectPage> createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
  String _selectedMaterial = 'НПВХ';
  final TextEditingController _projectNumberController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _projectNumberController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Новый проект',
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 35.w,
                  child: RadioListTile<String>(
                    activeColor: const Color(0xFF3C66F5),
                    title: const Text('НПВХ'),
                    value: 'НПВХ',
                    groupValue: _selectedMaterial,
                    onChanged: (value) {
                      setState(() {
                        _selectedMaterial = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    activeColor: const Color(0xFF3C66F5),
                    title: const Text('Алюминий'),
                    value: 'Алюминий',
                    groupValue: _selectedMaterial,
                    onChanged: (value) {
                      setState(() {
                        _selectedMaterial = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            _buildTextField(_projectNumberController, 'Номер проекта'),
            _buildTextField(_nameController, 'Наименование'),
            _buildTextField(_phoneController, 'Телефон',
                keyboardType: TextInputType.phone),
            _buildTextField(_addressController, 'Адрес'),
            _buildTextField(
              _descriptionController,
              'Описание',
            ),
            const Spacer(),
            Container(
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        maxLines: maxLines,
        keyboardType: keyboardType,
      ),
    );
  }
}
