# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: peeweep <peeweep at 0x0 dot ee>

pkgname=0ad-zh-lang
_pkgver=0.0.26
pkgver=a26
pkgrel=1
pkgdesc="Chinese Fonts and Translations For 0ad"
arch=(any)
url="https://play0ad.com/"
license=('GPL')
depends=(0ad=${pkgver} 0ad-data=${pkgver})
source=(${pkgname}-${_pkgver}.zip::"http://releases.wildfiregames.com/locales/zh-lang-${_pkgver}.pyromod")
sha256sums=('1e47709831baaa5ff03df9ecd846a80eda643f78deb461cc797b9872f5787fdc')

package() {
  install -d ${pkgdir}/usr/share/0ad/data/mods/zh-lang
  cp -r l10n ${pkgdir}/usr/share/0ad/data/mods/zh-lang/l10n
  cp -r fonts ${pkgdir}/usr/share/0ad/data/mods/zh-lang/fonts
  cp mod.json ${pkgdir}/usr/share/0ad/data/mods/zh-lang/mod.json
}

# vim:set ts=2 sw=2 et:
