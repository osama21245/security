import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';
import 'package:security/core/Theme/app_pallete.dart';

import '../fun/CalcFeistal.dart';

class Encript extends StatefulWidget {
  const Encript({super.key});

  @override
  State<Encript> createState() => _EncriptState();
}

class _EncriptState extends State<Encript> {
  TextEditingController? plainText;
  TextEditingController? key1;
  TextEditingController? key2;
  String result = "";
  String operation = "XOR";
  String steps = "1";
  @override
  void initState() {
    plainText = TextEditingController();
    key1 = TextEditingController();
    key2 = TextEditingController();
    key2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    plainText!.dispose();
    key1!.dispose();
    key2!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Encription"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: plainText,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'plain text'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: key1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'key1'),
              ),
              const SizedBox(
                height: 10,
              ),
              if (steps == "2")
                TextFormField(
                  controller: key2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'key2'),
                ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      padding: const EdgeInsets.all(3),
                      borderRadius: BorderRadius.circular(15),
                      underline: const Text(""),
                      value: operation,
                      items: const [
                        DropdownMenuItem(
                          value: "XOR",
                          child: Text("XOR"),
                        ),
                        DropdownMenuItem(
                          child: Text("AND"),
                          value: "AND",
                        ),
                        DropdownMenuItem(
                          child: Text("OR"),
                          value: "OR",
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          operation = value!;
                        });
                      }),
                  DropdownButton(
                      padding: const EdgeInsets.all(3),
                      borderRadius: BorderRadius.circular(15),
                      underline: const Text(""),
                      value: steps,
                      items: const [
                        DropdownMenuItem(
                          child: Text("1"),
                          value: "1",
                        ),
                        DropdownMenuItem(
                          child: Text("2"),
                          value: "2",
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          steps = value!;
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: 300,
                child: InkWell(
                  hoverColor: Colors.red,
                  onTap: () {
                    if (steps == "1") {
                      result = feistalCipher1(
                          plainText!.text, key1!.text, operation);
                    } else {
                      result = feistalCipher2(plainText!.text, key1!.text,
                          key2!.text, operation, false);
                    }
                    setState(() {});
                  },
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/new_file (1).riv",
                    fit: BoxFit.contain,
                    onInit: (artboard) {
                      StateMachineController? controller =
                          StateMachineController.fromArtboard(
                              artboard, "State Machine 1");
                      artboard.addController(controller!);
                    },
                  ),
                ),
              ),
              const Spacer(),
              AnimatedContainer(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: AppPallete.greyColor,
                    borderRadius: BorderRadius.circular(20)),
                duration: const Duration(milliseconds: 500),
                child: Center(
                    child: Text("${result == "" ? "" : 'Result = $result'}")),
                width: result == "" ? 0 : 150,
              ),
              const Spacer()
            ],
          ),
        ),
      )),
    );
  }
}
