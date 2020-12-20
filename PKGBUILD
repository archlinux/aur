# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=skk-emoji-jisyo
pkgver=0.0.7
pkgrel=1
pkgdesc="Emoji Dictionaries for the SKK Japanese input method"
arch=("any")
url="https://github.com/uasi/skk-emoji-jisyo"
license=("MIT")
source=("https://github.com/uasi/skk-emoji-jisyo/archive/v${pkgver}.tar.gz")
md5sums=('7eb0ba0ddde76d70c859ae715b959da6')

package() {
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/README.md "${pkgdir}/usr/share/${pkgname}/README.md"
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE   "${pkgdir}/usr/share/${pkgname}/LICENSE"
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/SKK-JISYO.emoji.utf8 "${pkgdir}/usr/share/${pkgname}/SKK-JISYO.emoji.utf8"
}
