import 'package:flutter/material.dart';

class TextFieldControllerCustom {
  
  static final TextEditingController projectNumberController =
      TextEditingController();
  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController phoneController = TextEditingController();
  static final TextEditingController addressController =
      TextEditingController();
  static final TextEditingController descriptionController =
      TextEditingController();

  void dispose() {
    projectNumberController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    descriptionController.dispose();
  }
}
