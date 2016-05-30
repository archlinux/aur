# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=prosody-mod-s2s-auth-dane
pkgver=2016.05.28
pkgrel=4
pkgdesc="implements DANE as server to server authentication for prosody xmpp server"
url="https://modules.prosody.im/mod_s2s_auth_dane.html"
arch=('any')
license=('MIT')
depends=("prosody" "lua-sec")
optdepends=("luaunbound: unbound bindings for DNSSEC-aware resolving")
source=("https://hg.prosody.im/prosody-modules/raw-file/7155ed1fb540/mod_s2s_auth_dane/mod_s2s_auth_dane.lua")
md5sums=('5b9d0e3c5edcf8285ff683bd17e683ea')
 
package() {
    install -Dm 644 "mod_s2s_auth_dane.lua" "${pkgdir}/usr/lib/prosody/modules/mod_s2s_auth_dane.lua"
}
