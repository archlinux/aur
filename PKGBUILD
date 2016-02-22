# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=liveusb-creator
pkgver=3.13.2
pkgrel=1
pkgdesc="Fedora's Live USB Creator"
arch=('any')
url="https://fedorahosted.org/liveusb-creator/"
license=('GPL')
depends=('python2')
source=("https://fedorahosted.org/releases/l/i/liveusb-creator/liveusb-creator-${pkgver}.tar.bz2")
sha256sums=('4a7ad306eefad66a98cc5693ebacb9e60d4c41644621e554da69c211a945c2c0')
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  python2 setup.py install --root="${pkgdir}/" --optimize=1 
}
 
# vim:set ts=2 sw=2 et:
