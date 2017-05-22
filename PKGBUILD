# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=dawawin
pkgver=0.10.3
pkgrel=1
pkgdesc="Arabic poems" 
license=('custom')
arch=('any')
depends=('python' 'xdg-utils' 'hicolor-icon-theme')
url="https://github.com/RaaH/dawawin"
sha256sums=('64599393fbf091bc660f4d688076e17b97648b7205c26eb056df572f042bd277')
source=(https://sourceforge.net/projects/${pkgname}/files/Dawawin-$pkgver.tar.xz)

package() {
  cd ${srcdir}/Dawawin-${pkgver}
  python setup.py install --root=${pkgdir} --record=installed-files.txt
}
