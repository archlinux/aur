# Maintainer: Fink Dennis <dennis.fink@c3l.lu>
pkgname=prosody-mod-mam
pkgver=0.10.0
pkgrel=2
pkgdesc="XEP-0313: Message Archive Management"
arch=('any')
url="https://hg.prosody.im/prosody-modules/file/tip/mod_mam/"
license=('MIT')
depends=('prosody')
source=(
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/mod_mam.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/rsm.lib.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/mamprefsxml.lib.lua"
    "https://hg.prosody.im/prosody-modules/raw-file/tip/mod_mam/mamprefs.lib.lua"
)
sha1sums=('f1d30a244168997896364dac475c9d92a4ab7e29'
          '688f40d17cbd923e87961dd17a179faf4784680d'
          'a44af61f52d73759855463d018065dd14e226181'
          '1e540fcf598385ec30b32a98d0a0e310dc85df0d')

package() {
  install -Dm 644 "mod_mam.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/mod_mam.lua"
  install -Dm 644 "rsm.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/rsm.lib.lua"
  install -Dm 644 "mamprefsxml.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/mamprefsxml.lib.lua"
  install -Dm 644 "mamprefs.lib.lua" "${pkgdir}/usr/lib/prosody/modules/mod_mam/mamprefs.lib.lua"
}
