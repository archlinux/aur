# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=prosody-mod-s2s-auth-dane
pkgver=2016.01.31
pkgrel=4
pkgdesc="implements DANE as server to server authentication for prosody xmpp server"
url="https://modules.prosody.im/mod_s2s_auth_dane.html"
arch=('any')
license=('MIT')
depends=("prosody" "lua-sec")
optdepends=("luaunbound: unbound bindings for DNSSEC-aware resolving")
source=("https://hg.prosody.im/prosody-modules/raw-file/39774b078dde/mod_s2s_auth_dane/mod_s2s_auth_dane.lua")
md5sums=('7bbdb1235a8355b42790ee52265046af')
 
package() {
    install -Dm 644 "mod_s2s_auth_dane.lua" "${pkgdir}/usr/lib/prosody/modules/mod_s2s_auth_dane.lua"
}
