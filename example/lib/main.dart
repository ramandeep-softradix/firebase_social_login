import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:social_login_plugin/social_login_plugin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SocialLoginPlugin().iniFirebase();
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
  }

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

              socialLoginButtonWidget(
                  title: 'Google',
                  onPressed: () async {
                    var data = await _socialLoginPlugin.signInWithGoogle();
                    log("data : ${data.toString()}");
                  }),
              const SizedBox(
                height: 20,
              ),
              socialLoginButtonWidget(
                  title: 'Facebook',
                  onPressed: () async {
                    var data = await _socialLoginPlugin.signInWithFacebook();
                    log("data : ${data.toString()}");
                  }),
              const SizedBox(
                height: 20,
              ),
              socialLoginButtonWidget(
                  title: 'Apple',
                  onPressed: () async {
                    var data = await _socialLoginPlugin.signInWithApple();
                    log("data : ${data.toString()}");
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialLoginButtonWidget(
      {required String title, required Function() onPressed}) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
      style: ElevatedButton.styleFrom(
          elevation: 12.0, textStyle: const TextStyle(color: Colors.white)),
      child: Text(title),
    );
  }
}
