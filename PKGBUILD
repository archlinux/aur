# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=prosody-mod-carbons
pkgver=0.9.8
pkgrel=2
pkgdesc="XEP-0280: Message Carbons"
arch=('any')
url="http://hg.prosody.im/prosody-modules/file/tip/mod_carbons"
license=('MIT')
depends=('prosody')
source=("http://hg.prosody.im/prosody-modules/raw-file/tip/mod_carbons/mod_carbons.lua")
sha1sums=(SKIP)

package() {
  install -Dm 644 "mod_carbons.lua" "${pkgdir}/usr/lib/prosody/modules/mod_carbons.lua"
}
