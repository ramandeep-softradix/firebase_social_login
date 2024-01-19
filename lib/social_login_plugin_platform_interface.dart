import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'social_login_plugin_method_channel.dart';

abstract class SocialLoginPluginPlatform extends PlatformInterface {
  /// Constructs a SocialLoginPluginPlatform.
  SocialLoginPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SocialLoginPluginPlatform _instance = MethodChannelSocialLoginPlugin();

  /// The default instance of [SocialLoginPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSocialLoginPlugin].
  static SocialLoginPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SocialLoginPluginPlatform] when
  /// they register themselves.
  static set instance(SocialLoginPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
