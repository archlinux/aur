# Maintainer: Chuan Ji <jichuan89[at]gmail[dot]com>
pkgname=gatotray
pkgver=2.0
pkgrel=2
pkgdesc="Graphical CPU stats monitor in the system tray."
url="http://code.google.com/p/gatotray/"
arch=('x86_64' 'i686')
license=('Creative Commons')
depends=('gtk2' 'xterm')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://gatotray.googlecode.com/files/gatotray-v2.0.tar.bz2")
md5sums=('eb1f92e923b0a5a93bcf53a25e6eed16')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  strip gatotray
  install -Dm755 gatotray "${pkgdir}/usr/bin/gatotray"
}

# vim:set ts=2 sw=2 et:
