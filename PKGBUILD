# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=ffutils
pkgver=1.0.3
pkgrel=1
pkgdesc="Collection of ffmpeg(1) scripts"
arch=('x86_64')
url="https://codeberg.org/maandree/ffutils"
license=('custom:ISC')
source=($pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(9067d3ac1a09e41ce8591fcf6e748a29399d07a391429b5a75376362bebfb474)

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
