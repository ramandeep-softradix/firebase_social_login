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

Initialize Firebase before using any social login functionalities:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SocialLoginPlugin().iniFirebase();
  runApp(MyApp());
}
```

### Sign In with Google

```dart
var googleData =  await SocialLoginPlugin().signInWithGoogle();
```

### Sign In with Facebook

```dart
var facebookData = await SocialLoginPlugin().signInWithFacebook();
```

### Sign In with Apple

```dart
var appleData = await SocialLoginPlugin().signInWithApple();
```