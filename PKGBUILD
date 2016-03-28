# Maintainer: Fink Dennis <dennis.fink@c3l.lu>
# Submitter: Jon Eyolfson <jon@eyolfson.com>
pkgname=prosody-mod-smacks
pkgver=0.9.1
pkgrel=5
pkgdesc="XEP-0198: Reliability and fast reconnects for Prosody"
arch=('any')
url="http://modules.prosody.im/mod_smacks.html"
license=('MIT')
depends=('prosody')
source=("http://hg.prosody.im/prosody-modules/raw-file/tip/mod_smacks/mod_smacks.lua")
sha1sums=('182352b787ab292e48263e6c1a679652c880cf95')

package() {
  install -Dm 644 "mod_smacks.lua" "${pkgdir}/usr/lib/prosody/modules/mod_smacks.lua"
}
