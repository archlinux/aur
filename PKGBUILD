# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=0ad-zh-lang
pkgver=a24.b
_pkgver=0.0.24
pkgrel=1
pkgdesc="Chinese Fonts and Translations For 0ad"
arch=(any)
url="https://play0ad.com/"
license=('GPL')
depends=(0ad=${pkgver} 0ad-data=${pkgver})
source=(${pkgname}-${_pkgver}.zip::"http://releases.wildfiregames.com/locales/zh-lang-${_pkgver}.pyromod")
sha256sums=('ca66ade52746f8dc1b37f9193a1303500a7ca3e9c70c082e21aebecd73a5668c')

package() {
  install -d 644 ${pkgdir}/usr/share/0ad/data/mods/public
  cp -r ${srcdir}/fonts ${pkgdir}/usr/share/0ad/data/mods/public/
  cp -r ${srcdir}/l10n ${pkgdir}/usr/share/0ad/data/mods/public/
  cp -r ${srcdir}/mod.json ${pkgdir}/usr/share/0ad/data/mods/public/
}

# vim:set ts=2 sw=2 et:
