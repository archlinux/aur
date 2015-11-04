# Maintainer: Polichronucci <nick AT discloud DOT eu>
pkgname=prosody-mod-onions
pkgver=01_11_2015
pkgrel=1
pkgdesc="s2s communication through TOR"
arch=('any')
url="http://hg.prosody.im/prosody-modules/file/tip/mod_blocking"
license=('MIT')
depends=('prosody')
source=("https://hg.prosody.im/prosody-modules/raw-file/ff95d983940c/mod_blocking/mod_blocking.lua")
sha1sums=("febbf82f5b1735e87abf57c2eceefe0242aa27e5")

package() {
  install -Dm 644 "mod_onions.lua" "${pkgdir}/usr/lib/prosody/modules/mod_onions.lua"
}
