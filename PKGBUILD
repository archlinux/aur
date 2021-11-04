# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>

pkgname=verible-bin
pkgver=0.0
pkgrel=1710
pkgdesc='SystemVerilog parser, linter, formatter and etc from Google'
arch=('x86_64')
url='https://github.com/google/verible'
license=('Apache License 2.0')
provides=('verible')

_githash='g5dc8b11b'
source=("https://github.com/chipsalliance/verible/releases/download/v${pkgver}-${pkgrel}-${_githash}/verible-v${pkgver}-${pkgrel}-${_githash}-CentOS-7.9.2009-Core-x86_64.tar.gz")
sha512sums=('25b8bcc3a82096b36cffbdc02d47349b589594917060eba4dad1c542862b8e6ffe409be82e6605dd92aff8424f958998ae8736399779f7ea498ca14095d39468')

package() {
  cd $srcdir/verible-v${pkgver}-${pkgrel}-${_githash}
  mkdir -p $pkgdir/usr/

  cp -R bin $pkgdir/usr/
  cp -R share $pkgdir/usr/
}
