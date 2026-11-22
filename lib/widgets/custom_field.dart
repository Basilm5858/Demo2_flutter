import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;

  const new({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please fill the field";
          } else if (label == "Password" && value.length < 8) {
            return "Password must be at least 8 characters";
          } else if (label == "Name" && value.length < 3) {
            return "Password must be at least 3 characters";
          } else if (label == "Email" && !value.contains("@gmail.com")) {
            return "Enter valid email";
          }
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
