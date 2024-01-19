import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'social_login_plugin_platform_interface.dart';

/// An implementation of [SocialLoginPluginPlatform] that uses method channels.
class MethodChannelSocialLoginPlugin extends SocialLoginPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('social_login_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
