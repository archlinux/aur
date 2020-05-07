# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=pstreams
pkgver=1.0.1
pkgrel=1
pkgdesc='C++ utility for simple IOStream-based Inter-Process Communication.'
arch=('any')
url='http://pstreams.sourceforge.net'
license=('LGPL')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('23199e3d12a644a2a0c66ec889d4c064')

package() {
  cd ${pkgname}-${pkgver}

  install -D -m644 pstream.h \
    ${pkgdir}/usr/include/pstreams/pstream.h
}
