import 'package:flutter/material.dart';
import 'package:homies_filteration/components/custom_text.dart';

class CustomMatchTile extends StatelessWidget {
  String p1, p2, p3, p4;
  CustomMatchTile(
      {required this.p1, required this.p2, required this.p3, required this.p4});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                stops: [0.499, 0.5, .509],
                colors: [Colors.black87, Colors.black, Colors.black87],
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [CustomText(text: p1), CustomText(text: p2)],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [CustomText(text: p3), CustomText(text: p4)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
