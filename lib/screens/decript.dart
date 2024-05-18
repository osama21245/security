import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:security/core/Theme/app_pallete.dart';

import '../fun/CalcFeistal.dart';

class Decript extends StatefulWidget {
  const Decript({super.key});

  @override
  State<Decript> createState() => _DecriptState();
}

class _DecriptState extends State<Decript> {
  TextEditingController? plainText;
  TextEditingController? key1;
  TextEditingController? key2;
  SMITrigger? click;
  SMITrigger? hover;
  bool animation = false;
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
      backgroundColor: Color.fromARGB(255, 0, 15, 24),
      appBar: AppBar(
        title: const Text("Decription"),
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
                ],
              ),
              Container(
                height: 150,
                width: 300,
                child: InkWell(
                  onTap: () {
                    animation = true;
                    result = feistalCipher2(plainText!.text, key1!.text,
                        key2!.text, operation, true);
                    print("test");
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
                      click = controller.findInput<bool>("CLICK") as SMITrigger;
                      hover = controller.findInput<bool>("HOVER") as SMITrigger;
                    },
                  ),
                ),
              ),
              Spacer(),
              AnimatedContainer(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: AppPallete.greyColor,
                    borderRadius: BorderRadius.circular(20)),
                duration: const Duration(milliseconds: 500),
                child: Center(
                    child: Text("${result == "" ? "" : 'Result = $result'}")),
                width: !animation ? 0 : 150,
              ),
              Spacer()
            ],
          ),
        ),
      )),
    );
  }
}
