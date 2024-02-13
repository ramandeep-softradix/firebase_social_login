//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <social_login_plugin/social_login_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) social_login_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SocialLoginPlugin");
  social_login_plugin_register_with_registrar(social_login_plugin_registrar);
}
