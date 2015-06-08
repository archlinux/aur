# Maintainer: Jameson Pugh <jameson.pugh@gmail.com>

pkgname=mpxj
pkgver=4.7.3
pkgrel=1
pkgdesc="A Java based project file reader/writter."
arch=('any')
url="http://mpxj.sourceforge.net"
license=('LGPL')
depends=('apache-poi' 'java-environment')
makedepends=('java-environment')
source=("http://downloads.sourceforge.net/mpxj/${pkgname}-${pkgver}.zip")
sha256sums=('ac48fd2bcec142e152b64329da33be6b50ca61bd543c12aed92ce8e1e2a95694')

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/share/java"
  install -m644 mpxj.jar "${pkgdir}/usr/share/java"
}

# vim:set ts=2 sw=2 et:
