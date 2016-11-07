# Maintainer: Jameson Pugh <jameson.pugh@gmail.com>

pkgname=mpxj
pkgver=5.5.2
pkgrel=1
pkgdesc="A Java based project file reader/writter."
arch=('any')
url="http://mpxj.sourceforge.net"
license=('LGPL')
depends=('apache-poi' 'java-environment')
makedepends=('java-environment')
source=("http://downloads.sourceforge.net/mpxj/${pkgname}-${pkgver}.zip")
sha256sums=('a434a4e0fd537701329aeeb78e5fcefc798b8e2fe71488547df684d11fd4d98c')

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/share/java"
  install -m644 mpxj.jar "${pkgdir}/usr/share/java"
}

# vim:set ts=2 sw=2 et:
