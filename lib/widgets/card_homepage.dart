import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

Widget cardHome(BuildContext context, String titulo, VoidCallback caminho,
    String imagem, Color cor) {
  return GestureDetector(
    onTap: () async {
      caminho();

      Vibration.vibrate(duration: 100);
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.width * 0.25,
            constraints: const BoxConstraints(maxHeight: 150),
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 96,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: null,
                              icon: Image.asset(
                                imagem,
                                height:
                                    MediaQuery.of(context).size.width * 0.23,
                                width: MediaQuery.of(context).size.width * 0.21,
                              )),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Divider(
                              thickness: MediaQuery.of(context).size.width *
                                  0.2, // Espessura da linha
                              color: cor, // Cor da linha
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Divider(
                            thickness: 5, // Espessura da linha
                            color: Color.fromARGB(
                                0, 255, 255, 255), // Cor da linha
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Divider(
                              thickness: MediaQuery.of(context).size.width *
                                  0.2, // Espessura da linha
                              color: cor, // Cor da linha
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Divider(
                            thickness: 5, // Espessura da linha
                            color: Color.fromARGB(
                                0, 255, 255, 255), // Cor da linha
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: titulo,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              backgroundColor:
                                  Color.fromARGB(55, 255, 255, 255)),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )),
      ),
    ),
  );
}
