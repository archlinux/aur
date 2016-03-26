# Maintainer: Jeffrey Tolar <tolar.jeffrey at gmail dot com>

pkgname=verilator
pkgver=3.882
pkgrel=1
pkgdesc='The fastest free Verilog HDL simulator'
url=http://www.veripool.org/projects/verilator/wiki/Intro
arch=(any)
license=('LGPL')
depends=()

source=("http://www.veripool.org/ftp/${pkgname}-${pkgver}.tgz")
md5sums=('2a8171b4184c64e4007a5ca5a3e66bf6')

build() {
  cd "verilator-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "verilator-${pkgver}"

  make install DESTDIR=$pkgdir
}

