import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:social_login_plugin_example/social_login_plugin.dart';
import 'package:social_login_plugin_example/social_login_plugin_method_channel.dart';
import 'package:social_login_plugin_example/social_login_plugin_platform_interface.dart';

class MockSocialLoginPluginPlatform
    with MockPlatformInterfaceMixin
    implements SocialLoginPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SocialLoginPluginPlatform initialPlatform = SocialLoginPluginPlatform.instance;

  test('$MethodChannelSocialLoginPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSocialLoginPlugin>());
  });

  test('getPlatformVersion', () async {
    SocialLoginPlugin socialLoginPlugin = SocialLoginPlugin();
    MockSocialLoginPluginPlatform fakePlatform = MockSocialLoginPluginPlatform();
    SocialLoginPluginPlatform.instance = fakePlatform;

    expect(await socialLoginPlugin.getPlatformVersion(), '42');
  });
}
