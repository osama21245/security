import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:security/fun/CalcFeistal.dart';

class Rc4Screen extends StatefulWidget {
  const Rc4Screen({super.key});

  @override
  State<Rc4Screen> createState() => _Rc4ScreenState();
}

class _Rc4ScreenState extends State<Rc4Screen> {
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 300,
              child: InkWell(
                onTap: () {
                  result = rc4();

                  setState(() {});
                },
                child: RiveAnimation.asset(
                  "assets/RiveAssets/new_file.riv",
                  fit: BoxFit.cover,
                  onInit: (artboard) {
                    StateMachineController? controller =
                        StateMachineController.fromArtboard(
                            artboard, "State Machine 1");
                    artboard.addController(controller!);
                  },
                ),
              ),
            ),
            Text(result)
          ],
        ),
      ),
    );
  }
}
