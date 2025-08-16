# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=numaplayer
pkgver=2.1.7
pkgrel=2
pkgdesc="Set your music and inspiration totally free."
arch=('x86_64')
url="https://www.studiologic-music.com/products/numaplayer"
license=('custom:proprietary')
source=("https://www.studiologic-music.com/api/get-files/NumaPlayer_${pkgver}.deb")
sha256sums=('4d1e607888ec9c9c1e67c4bac39a257b5adef40768e27919f35c79167e247df5')

package() {
    cd "$srcdir"
    ar x NumaPlayer_${pkgver}.deb
    tar -xf data.tar.* -C "$pkgdir"
}    