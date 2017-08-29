# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=dawawin
pkgver=0.11.0
pkgrel=1
pkgdesc="Arabic poems" 
license=('custom')
arch=('any')
depends=('python' 'xdg-utils' 'hicolor-icon-theme')
url="https://github.com/RaaH/dawawin"
sha256sums=('41c717e622dcca54b35519d3ac208145ccd85904d967d1101a43fc9116d65bde')
source=(https://sourceforge.net/projects/${pkgname}/files/Dawawin-$pkgver.tar.xz)

package() {
  cd ${srcdir}/Dawawin-${pkgver}
  python setup.py install --root=${pkgdir} --record=installed-files.txt
}
