# Maintainer: Ahmed Najmawi <iramosu@protonmail.com>
pkgname=otf-alusus-mono
pkgver=1.0
pkgrel=1
pkgdesc="A monospaced Arabic font/typeface."
arch=('any')
url="A monospaced Arabic typeface."
license=('custom: All rights reserved')
source=("https://alusus.org/fonts/AlususMono.otf")
sha256sums=('8357e8f43d7e5857d778251a42363b7d91ce1feff7fc606f842e23ed81821b29')

package() {
    install -dm755 "$pkgdir/usr/share/fonts/OTF"
    install -m644 "${srcdir}/AlususMono.otf" "$pkgdir/usr/share/fonts/OTF/"
}

