# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=skk-emoji-jisyo-ja
pkgver=20180513
pkgrel=1
pkgdesc="Emoji Dictionaries for the SKK Japanese input method in Japanese"
arch=("any")
url="https://github.com/ymrl/SKK-JISYO.emoji-ja"

license=("BSD")
source=("https://github.com/ymrl/SKK-JISYO.emoji-ja/archive/master.zip")
md5sums=('e482f85cbd0cb38a7dbd5efaf94a7749')

package() {
  install -D -m644 ${srcdir}/SKK-JISYO.emoji-ja-master/README.md "${pkgdir}/usr/share/${pkgname}/README.md"
  install -D -m644 ${srcdir}/SKK-JISYO.emoji-ja-master/LICENSE   "${pkgdir}/usr/share/${pkgname}/LICENSE"
  install -D -m644 ${srcdir}/SKK-JISYO.emoji-ja-master/SKK-JISYO.emoji-ja.utf8 "${pkgdir}/usr/share/${pkgname}/SKK-JISYO.emoji-ja.utf8"
}
