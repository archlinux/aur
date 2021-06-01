# Maintainer: Bas Timmer <basjetimmer at yahoo dot com >

pkgname=pstreams
pkgver=1.0.3
pkgrel=1
pkgdesc='C++ utility for simple IOStream-based Inter-Process Communication.'
arch=('any')
url='http://pstreams.sourceforge.net'
license=('LGPL')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e9ca807bc6046840deae63207183f9ac516e67187d035429772a5fc7bd3e8fc8')

package() {
  cd ${pkgname}-${pkgver}

  install -D -m644 pstream.h \
    ${pkgdir}/usr/include/pstreams/pstream.h
}
