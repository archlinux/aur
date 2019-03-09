# Maintainer: Jonas Gierer <jgierer12@gmail.com>
pkgname=pocket-casts-linux-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Electron wrapper around the Pocket Casts web app with support for MPRIS (media controls)"
arch=('x86_64')
license=('MIT')
url="https://github.com/jgierer12/pocket-casts-linux"
source=("https://github.com/jgierer12/pocket-casts-linux/releases/download/v$pkgver/pocket-casts-linux-$pkgver-x64.pacman")
md5sums=('8f07b49aebffac1bc6d1af0017cdfbd0')

package() {
  mv "${srcdir}/usr" "${pkgdir}/usr"
  mv "${srcdir}/opt" "${pkgdir}/opt"
}
