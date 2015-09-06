# Maintainer: Fink Dennis <dennis.fink@c3l.lu>
pkgname=prosody-mod-mam-adhoc
pkgver=0.10.0
pkgrel=2
pkgdesc="Ad-hoc interface to Message Archive Management Settings"
arch=('any')
url="https://hg.prosody.im/prosody-modules/file/tip/mod_mam_adhoc/"
license=('MIT')
depends=('prosody')
source=(
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam_adhoc/mod_mam_adhoc.lua"
)
sha1sums=('f6f6daaf07a7ba2f8835542c54d4cce6f7c31d82')

package() {
  install -Dm 644 "mod_mam_adhoc.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam_adhoc.lua"
}
