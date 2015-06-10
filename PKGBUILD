# Maintainer: Chuan Ji <jichuan89[at]gmail[dot]com>
pkgname=gatotray
pkgver=2.3
pkgrel=1
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
_r="4218cadee76b8a9e9e01bb78de2866cdeafb7a5f"
source=("https://gatotray.googlecode.com/archive/${_r}.tar.gz")
md5sums=('c237fbe24cf111cfc6072796402ef7f4')

build() {
  cd "${srcdir}/"${pkgname}-*
  make
}

package() {
  cd "${srcdir}/"${pkgname}-*
  strip gatotray
  install -Dm755 gatotray "${pkgdir}/usr/bin/gatotray"
}

# vim:set ts=2 sw=2 et:
md5sums=('9340dbb82c5be2ae3f7c17d23958e0a7')
