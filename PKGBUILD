# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=skk-emoji-jisyo
pkgver=0.0.6
pkgrel=1
pkgdesc="Emoji Dictionaries for the SKK Japanese input method"
arch=("any")
url="https://github.com/uasi/skk-emoji-jisyo"
license=("MIT")
source=("https://github.com/uasi/skk-emoji-jisyo/archive/v${pkgver}.tar.gz")
md5sums=('c7621183d5995c1dacaa59a7137fb26b')

package() {
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/README.md "${pkgdir}/usr/share/${pkgname}/README.md"
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE   "${pkgdir}/usr/share/${pkgname}/LICENSE"
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/SKK-JISYO.emoji.utf8 "${pkgdir}/usr/share/${pkgname}/SKK-JISYO.emoji.utf8"
}
