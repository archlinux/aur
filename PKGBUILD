# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: peeweep <peeweep at 0x0 dot ee>

pkgname=0ad-zh-lang
_pkgver=0.27.0
pkgver=a27.0
pkgrel=2
pkgdesc="Chinese Fonts and Translations For 0ad"
arch=(any)
url="https://play0ad.com/"
license=('GPL-2.0-or-later' 'OFL-1.1')
depends=(0ad 0ad-data)
source=(${pkgname}-${_pkgver}.zip::"http://releases.wildfiregames.com/locales/zh-lang-${_pkgver}.pyromod")
sha256sums=('a4c03d34857949c04574108ccedc672c4d45401e12d9b231731bdecedb0748aa')

package() {
  install -d ${pkgdir}/usr/share/0ad/data/mods/zh-lang
  cp -r l10n ${pkgdir}/usr/share/0ad/data/mods/zh-lang/l10n
  cp -r fonts ${pkgdir}/usr/share/0ad/data/mods/zh-lang/fonts
  install -Dm644 mod.json ${pkgdir}/usr/share/0ad/data/mods/zh-lang

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm644 fonts/SourceHanSans-LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
