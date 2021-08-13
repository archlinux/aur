# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=0ad-zh-lang
pkgver=a25
_pkgver=0.0.25
pkgrel=1
pkgdesc="Chinese Fonts and Translations For 0ad"
arch=(any)
url="https://play0ad.com/"
license=('GPL')
depends=(0ad=${pkgver} 0ad-data=${pkgver})
source=(${pkgname}-${_pkgver}.zip::"http://releases.wildfiregames.com/locales/zh-lang-${_pkgver}.pyromod")
sha256sums=('c9842d4ab73f6bb662f53328e573e2161459e0bef3609a6010e2df4daea9962c')

package() {
  install -d 644 ${pkgdir}/usr/share/0ad/data/mods/public
  cp -r ${srcdir}/fonts ${pkgdir}/usr/share/0ad/data/mods/public/
  cp -r ${srcdir}/l10n ${pkgdir}/usr/share/0ad/data/mods/public/
  cp -r ${srcdir}/mod.json ${pkgdir}/usr/share/0ad/data/mods/public/
}

# vim:set ts=2 sw=2 et:
