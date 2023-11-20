import 'package:flutter/material.dart';
import 'package:homies_filteration/consts.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback function;
  CustomButton({required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: height * 0.21,
        width: width * 0.41,
        child: ElevatedButton(
            onPressed: function,
            child: Text(text),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(KBorderRadiusButton)))),
      ),
    );
  }
}
