# Maintainer: Fink Dennis <dennis.fink@c3l.lu>
pkgname=prosody-mod-blocking
pkgver=0.10.0
pkgrel=1
pkgdesc="XEP-0191: Simple Communications Blocking support"
arch=('any')
url="http://hg.prosody.im/prosody-modules/file/tip/mod_blocking"
license=('MIT')
depends=('prosody')
source=("http://hg.prosody.im/prosody-modules/raw-file/tip/mod_blocking/mod_blocking.lua")
sha1sums=('febbf82f5b1735e87abf57c2eceefe0242aa27e5')

package() {
  install -Dm 644 "mod_blocking.lua" "${pkgdir}/usr/lib/prosody/modules/mod_blocking.lua"
}
