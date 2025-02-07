# Maintainer: Bas Timmer <basjetimmer at yahoo dot com >

pkgname=pstreams
pkgver=1.0.4
pkgrel=1
pkgdesc='C++ utility for simple IOStream-based Inter-Process Communication.'
arch=('any')
url='http://pstreams.sourceforge.net'
license=('LGPL')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9db179cc4ca37dcf21f58b8320e33f626a275df8560c688c88c51797e02a04d6')

package() {
  cd ${pkgname}-${pkgver}

  install -D -m644 pstream.h \
    ${pkgdir}/usr/include/pstreams/pstream.h
}
