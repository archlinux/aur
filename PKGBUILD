# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>

pkgname=verible-bin
pkgver=0.0
pkgrel=948
pkgdesc='SystemVerilog parser, linter, formatter and etc from Google'
arch=('x86_64')
url='https://github.com/google/verible'
license=('Apache License 2.0')
provides=('verible')

_prefix='verible-v0.0-948-g35680eb'
source=("https://github.com/google/verible/releases/download/v0.0-948-g35680eb/${_prefix}-CentOS-7.9.2009-Core-x86_64.tar.gz")
sha512sums=('0334f3b5126c5bf57523a93ccf66952c0a422e2fd5fe8f2aea29a6ac99b3e2fac54edbdfa80129439e3b420f7197a663e57cfbfd4c3d56bfab1043201d3d04cd')

package() {
  cd $srcdir/${_prefix}
  mkdir -p $pkgdir/usr/

  cp -R bin $pkgdir/usr/
  cp -R share $pkgdir/usr/
}
