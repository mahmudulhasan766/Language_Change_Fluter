import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List languageCode = ["en", "ta", "bn"];
List countryCode = ["US", "IN", "BD"];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildText(),
            SizedBox(
              height: 15,
            ),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text("${('title'.tr().toString())}: ", Colors.blue),
        text('message'.tr().toString(), Colors.red),
        Text('message'.tr().toString())
      ],
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        button("English", 0),
        SizedBox(
          width: 30,
        ),
        button("தமிழ்", 1),
        SizedBox(
          width: 30,
        ),
        button("বাংলা", 2),
      ],
    );
  }

  Widget text(String text, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 25),
    );
  }

  Widget button(String text, int i) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {
        setState(() {
          EasyLocalization.of(context).locale =
              Locale(languageCode[i], countryCode[i]);
        });
      },
    );
  }
}
