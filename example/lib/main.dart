import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:social_login_plugin/social_login_plugin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String _platformVersion = 'Unknown';
  final _socialLoginPlugin = SocialLoginPlugin();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

/*
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _socialLoginPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             /* Center(
                child: Text('Running on: $_platformVersion\n'),
              ),*/
              socialLoginButtonWidget(title: 'Google', onPressed: () async{
                var data = await _socialLoginPlugin.signInWithGoogle();
                print("data : ${data.toString()}");
              }),

              SizedBox(height: 20,),

              socialLoginButtonWidget(title: 'Facebook', onPressed: () async{
                var data = await _socialLoginPlugin.signInWithFacebook();
                print("data : ${data.toString()}");
              }),

              const SizedBox(height: 20,),

              socialLoginButtonWidget(title: 'Apple', onPressed: () async{
                var data = await _socialLoginPlugin.signInWithApple();
                print("data : ${data.toString()}");
              }),
            ],
          ),
        ),
      ),
    );
  }




  Widget socialLoginButtonWidget({required String title, required Function() onPressed}){
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
      style: ElevatedButton.styleFrom(
          elevation: 12.0,
          textStyle: const TextStyle(color: Colors.white)),
      child: Text(title),
    );
  }
}
