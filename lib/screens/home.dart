import 'package:flutter/material.dart';
import 'package:security/screens/decript.dart';
import 'package:security/screens/encript.dart';
import 'package:security/screens/rc4.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Encript()));
                  },
                  child: Text("Encrypt")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Decript()));
                  },
                  child: Text("Decrypt")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Rc4Screen()));
                  },
                  child: Text("Rc4"))
            ],
          ),
        ),
      ),
    );
  }
}
