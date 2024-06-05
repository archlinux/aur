# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=skk-emoji-jisyo
pkgrel=1
pkgver=v0.0.9.r0.g7eadfd8
pkgdesc="Emoji Dictionaries for the SKK Japanese input method"
arch=("any")
url="https://github.com/uasi/skk-emoji-jisyo"
license=("MIT")
source=("git+https://github.com/uasi/skk-emoji-jisyo.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -D -m644 ${srcdir}/${pkgname}/README.md "${pkgdir}/usr/share/${pkgname}/README.md"
  install -D -m644 ${srcdir}/${pkgname}/LICENSE   "${pkgdir}/usr/share/${pkgname}/LICENSE"
  install -D -m644 ${srcdir}/${pkgname}/SKK-JISYO.emoji.utf8 "${pkgdir}/usr/share/${pkgname}/SKK-JISYO.emoji.utf8"
}
