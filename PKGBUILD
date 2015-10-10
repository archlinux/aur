# Maintainer: Jeffrey Tolar <tolar.jeffrey at gmail dot com>

pkgname=verilator
pkgver=3.876
pkgrel=1
pkgdesc='The fastest free Verilog HDL simulator'
url=http://www.veripool.org/projects/verilator/wiki/Intro
arch=(any)
license=('LGPL')
depends=()

source=("http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz")
md5sums=('d5df5788dc1d2d4089ae51fd32c57c9a')

build() {
  cd "verilator-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "verilator-${pkgver}"

  make install DESTDIR=$pkgdir
}

