# Maintainer: Fink Dennis <dennis.fink@c3l.lu>
# Submitter: Jon Eyolfson <jon@eyolfson.com>
pkgname=prosody-mod-smacks
pkgver=0.9.1
pkgrel=2
pkgdesc="XEP-0198: Reliability and fast reconnects for Prosody"
arch=('any')
url="http://code.google.com/p/prosody-modules/wiki/mod_smacks"
license=('MIT')
depends=('prosody')
source=("http://prosody-modules.googlecode.com/hg/mod_smacks/mod_smacks.lua")
sha1sums=('f693953b1e72ffbee541734f7c2f09a715e633e2')

package() {
  install -Dm 644 "mod_smacks.lua" "${pkgdir}/usr/lib/prosody/modules/mod_smacks.lua"
}
