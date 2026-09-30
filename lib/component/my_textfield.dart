import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  //list var parameter
  final String hint; //untuk di isi kan ketika di panggil
  final TextEditingController txtController;
  final double Radius;

  const CustomTextfield({super.key, required this.hint, required this.txtController, required this.Radius});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      decoration: InputDecoration(hint: Text(hint),border: OutlineInputBorder(borderRadius: BorderRadius.circular(Radius))),
    );
  }
}