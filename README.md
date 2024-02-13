# social_login_plugin

[![pub package](https://img.shields.io/pub/v/social_login_plugin.svg)](https://pub.dev/packages/firebase_ui_auth)

Firebase Social Login Plugin is a Flutter package that simplifies social login integration into your Flutter applications using Firebase Authentication. With this plugin, you can easily implement social login functionality for Google, Facebook, and Apple accounts without the need to handle complex authentication flows separately.


## AUTH support

| Feature/platform   | Android | iOS | Web              | macOS            | Windows          | Linux            |
| ------------------ | ------- | --- | ---------------- | ---------------- | ---------------- | ---------------- |
| Email              | ✓       | ✓   | ✓                | ✓                | ✓ <sup>(1)</sup> | ✓ <sup>(1)</sup> |
| Phone              | ✓       | ✓   | ✓                | ╳                | ╳                | ╳                |
| Email link         | ✓       | ✓   | ╳                | ╳                | ╳                | ╳                |
| Email verification | ✓       | ✓   | ✓ <sup>(2)</sup> | ✓ <sup>(2)</sup> | ✓ <sup>(1)</sup> | ✓ <sup>(1)</sup> |
| Sign in with Apple | ✓       | ✓   | ✓                | ✓                | ╳                | ╳                |
| Google Sign in     | ✓       | ✓   | ✓                | ✓                | ✓ <sup>(1)</sup> | ✓ <sup>(1)</sup> |
| Twitter Login      | ╳       | ╳    | ╳               | ╳                 |╳      | ╳      |
| Facebook Sign in   | ✓       | ✓   | ✓                | ✓                | ╳      <sup>(1)</sup> | ╳      <sup>(1)</sup> |


1. No deep-linking into app, so email verification link opens a web page


## Getting Started

### Installation
To use the Social Login Plugin in your Flutter project, add it to your `pubspec.yaml` file:
```yaml
dependencies:
  social_login_plugin: ^0.0.4
```

## Example

Here's a quick example that shows how to use 

```dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:social_login_plugin/social_login_plugin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SocialLoginPlugin().iniFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Social Login Example'),
        ),
        body: SocialLoginButtons(),
      ),
    );
  }
}

class SocialLoginButtons extends StatelessWidget {
  final SocialLoginPlugin _socialLoginPlugin = SocialLoginPlugin();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              var data = await _socialLoginPlugin.signInWithGoogle();
              print("Google login result: $data");
            },
            child: const Text('Sign in with Google'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              var data = await _socialLoginPlugin.signInWithFacebook();
              print("Facebook login result: $data");
            },
            child: const Text('Sign in with Facebook'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              var data = await _socialLoginPlugin.signInWithApple();
              print("Apple login result: $data");
            },
            child: const Text('Sign in with Apple'),
          ),
        ],
      ),
    );
  }
}
