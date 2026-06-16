# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

pkgname="librewolf-autoconfig-prefs"
pkgver="1"
pkgrel="1"
pkgdesc="Enables privileged autoconfig context for librewolf.overrides.cfg (required for uc.js loaders)"
arch=("any")
url="https://github.com/MrOtherGuy/fx-autoconfig"
license=("Unlicense")
depends=("librewolf")

package() {
  install -dm755 "${pkgdir}/usr/lib/librewolf/defaults/pref"

  cat > "${pkgdir}/usr/lib/librewolf/defaults/pref/config-prefs.js" <<EOF
pref("general.config.sandbox_enabled", false);
pref("general.config.obscure_value", 0);
EOF
}
