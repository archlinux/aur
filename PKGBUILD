# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>

pkgname=verible-bin
pkgver=0.0
pkgrel=1789
pkgdesc='SystemVerilog parser, linter, formatter and etc from Google'
arch=('x86_64')
url='https://github.com/google/verible'
license=('Apache License 2.0')
provides=('verible')

_githash='g43d1b6fe'
source=("https://github.com/chipsalliance/verible/releases/download/v${pkgver}-${pkgrel}-${_githash}/verible-v${pkgver}-${pkgrel}-${_githash}-CentOS-7.9.2009-Core-x86_64.tar.gz")
sha512sums=('0b7fae06de8df6290fdccfd173e59b9033204082ab1b0fd99e66c216db30af72083cb9041b2166fd4fd61571aca5991242d4c674e245b88f30a88be9fb057a5b')

package() {
  cd $srcdir/verible-v${pkgver}-${pkgrel}-${_githash}
  mkdir -p $pkgdir/usr/

  cp -R bin $pkgdir/usr/
  cp -R share $pkgdir/usr/
}
