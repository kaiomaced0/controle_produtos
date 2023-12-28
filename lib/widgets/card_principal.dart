import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

Widget cardPrincipal(BuildContext context, String caminho, Flexible? column1,
    Flexible? column2, Flexible? column3) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushReplacementNamed('/${caminho}');
      Vibration.vibrate();
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.width * 0.22,
          constraints: BoxConstraints(minHeight: 400 * 0.2),
          decoration: ShapeDecoration(
            color: const Color(0xFFF0E5F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 5,
                offset: Offset(5, 5),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [column1!, column2!, column3!],
            ),
          ),
        ),
      ),
    ),
  );
}
