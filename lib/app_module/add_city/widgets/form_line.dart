import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormLine extends StatelessWidget {
  const FormLine({
    Key? key,
    required this.text,
    required this.controller,
    required this.onChange,
     this.keyboardtype,
     this.inputFormatters,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;
  final Function(String value) onChange;
  final TextInputType? keyboardtype;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text),
            const SizedBox(
              height: 4,
            ),
            TextField(
              onChanged: onChange,
              controller: controller,
              keyboardType: keyboardtype,
              inputFormatters: inputFormatters,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            )
          ],
        ));
  }
}
