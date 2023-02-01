# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=skk-emoji-jisyo
pkgver=0.0.8
pkgrel=1
pkgdesc="Emoji Dictionaries for the SKK Japanese input method"
arch=("any")
url="https://github.com/uasi/skk-emoji-jisyo"
license=("MIT")
source=("https://raw.githubusercontent.com/uasi/skk-emoji-jisyo/master/README.md" "https://raw.githubusercontent.com/uasi/skk-emoji-jisyo/master/LICENSE" "https://raw.githubusercontent.com/uasi/skk-emoji-jisyo/master/SKK-JISYO.emoji.utf8")
md5sums=('e904367a25bd27a5199af3471b5b49be'
         'b38ac3ba86b729f5feb72b371f99c981'
         'b7d5154a378975bec52c2e972fc93c2c')

package() {
  install -D -m644 ${srcdir}/README.md "${pkgdir}/usr/share/${pkgname}/README.md"
  install -D -m644 ${srcdir}/LICENSE   "${pkgdir}/usr/share/${pkgname}/LICENSE"
  install -D -m644 ${srcdir}/SKK-JISYO.emoji.utf8 "${pkgdir}/usr/share/${pkgname}/SKK-JISYO.emoji.utf8"
}
