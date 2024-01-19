#include "include/social_login_plugin/social_login_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "social_login_plugin.h"

void SocialLoginPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  social_login_plugin::SocialLoginPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
