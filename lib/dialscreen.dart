import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class DialScreen extends StatefulWidget {
  const DialScreen({Key? key}) : super(key: key);

  @override
  State<DialScreen> createState() => _DialScreenState();
}

class _DialScreenState extends State<DialScreen> {
 TextEditingController dial = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dial Screen'),),
    body: Column(
      children: [
        DialPad(
            enableDtmf: true,
            outputMask: "000 000-0000",
            backspaceButtonIconColor: Colors.red,
            makeCall: (number){
              FlutterPhoneDirectCaller.callNumber(dial.text);
            }
        )

      ],
    ),
    );

  }
}
