# Maintainer: Reotip Fur <reotipfur@gmail.com>

pkgname=css-docs
pkgver=2.1
pkgrel=1
pkgdesc="Set of HTML documentation for CSS2.1"
arch=('any')
url="https://reotip.alwaysdata.net"
license=('GPL')
options=('docs')
source=('https://reotip.alwaysdata.net/css2.tgz')

package(){
  rm ${srcdir}/css2.tgz
  install -d ${pkgdir}/usr/share/doc/css/css2
  cp -a ${srcdir}/* ${pkgdir}/usr/share/doc/css/css2/ 
}

