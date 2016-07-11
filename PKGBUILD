# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=prosody-mod-s2s-auth-dane
pkgver=2016.06.01
_commit=90a444ccaa8e
pkgrel=1
pkgdesc="implements DANE as server to server authentication for prosody xmpp server"
url="https://modules.prosody.im/mod_s2s_auth_dane.html"
arch=('any')
license=('MIT')
depends=("prosody" "lua-sec")
optdepends=("luaunbound: unbound bindings for DNSSEC-aware resolving")
source=("https://hg.prosody.im/prosody-modules/raw-file/$_commit/mod_s2s_auth_dane/mod_s2s_auth_dane.lua")
md5sums=('75bfc61a73197b5bd3964cd27a0fc156')
 
package() {
    install -Dm 644 "mod_s2s_auth_dane.lua" "${pkgdir}/usr/lib/prosody/modules/mod_s2s_auth_dane.lua"
}
