# Maintainer: Polichronucci <nick AT discloud DOT eu>
pkgname=prosody-mod-onions
pkgver=14_10_2015
pkgrel=1
pkgdesc="s2s communication through TOR"
arch=('any')
url="http://hg.prosody.im/prosody-modules/file/tip/mod_blocking"
license=('MIT')
depends=('prosody')
source=("https://hg.prosody.im/prosody-modules/file/720b291cb340/mod_onions/mod_onions.lua")
sha1sums=("c2b1f13b5ffdff1cafda3cbe31fe5e8ea0635e22")

package() {
  install -Dm 644 "mod_onions.lua" "${pkgdir}/usr/lib/prosody/modules/mod_onions.lua"
}
