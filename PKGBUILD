# Maintainer: Brin Bidulock <bidulock@openss7.com>
# Contributor: Chuan Ji <jichuan89[at]gmail[dot]com>
pkgname=gatotray
pkgver=3.2
pkgrel=1
pkgdesc="Graphical CPU stats monitor in the system tray."
url="https;//bitbucket.org/gatopeich/gatotray"
arch=('x86_64' 'i686')
license=('CCPL:by')
depends=('gtk2' 'xterm')
_r="b019a7f8aa60"
source=("https://bitbucket.org/gatopeich/gatotray/get/${_r}.zip")
md5sums=('SKIP')

build() {
  cd gatopeich-gatotray-${_r}
  make
}

package() {
  cd gatopeich-gatotray-${_r}
  strip gatotray
  install -Dm755 gatotray "${pkgdir}/usr/bin/gatotray"
}

# vim:set ts=2 sw=2 et:
