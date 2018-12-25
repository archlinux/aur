# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgname=kodi-addon-graphlcd
pkgver=2.2.0
pkgrel=1
pkgdesc="Kodi service addon to interface with graphlcd"
url="https://github.com/M-Reimer/script.service.graphlcd"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python2' 'kodi' 'graphlcd-base')
source=("https://github.com/M-Reimer/script.service.graphlcd/archive/${pkgver}.tar.gz")
md5sums=('3cb4882a089065101a7c91de1634d48b')

build() {
  cd "${srcdir}/script.service.graphlcd-$pkgver"
  make
}

package() {
  cd "${srcdir}/script.service.graphlcd-$pkgver"
  make DESTDIR=$pkgdir install
}
