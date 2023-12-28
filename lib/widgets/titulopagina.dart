import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

Widget cardTitulo(BuildContext context, String titulo, VoidCallback caminho) {
  return GestureDetector(
    onTap: () {
      Vibration.vibrate(duration: 100);
      caminho();
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.08,
          constraints:
              const BoxConstraints(maxHeight: 400 * 0.08, maxWidth: 400 * 0.6),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  '$titulo',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
