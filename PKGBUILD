# Maintainer: Fink Dennis <dennis.fink@c3l.lu>
pkgname=prosody-mod-carbons-adhoc
pkgver=0.9.8
pkgrel=1
pkgdesc="Ad-hoc interface to mod_carbons"
arch=('any')
url="http://hg.prosody.im/prosody-modules/file/tip/mod_carbons_adhoc"
license=('MIT')
depends=('prosody')
source=("http://hg.prosody.im/prosody-modules/raw-file/tip/mod_carbons_adhoc/mod_carbons_adhoc.lua")
sha1sums=('27fad1448b82d8de2e581bf107295ccf7a7d0131')

package() {
  install -Dm 644 "mod_carbons_adhoc.lua" "${pkgdir}/usr/lib/prosody/modules/mod_carbons_adhoc.lua"
}
