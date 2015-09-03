# Contributor: Philipp Moeller <bootsarehax@gmail.com>
pkgname=esbtl
pkgver=1.0_beta01
pkgrel=1
pkgdesc="A C++ header-only library for easy structural biology computations and geometric constructions"
arch=('any')
url='http://esbtl.sourceforge.net/'
license=('GPL')
depends=()
source=("http://downloads.sourceforge.net/project/esbtl/ESBTL-${pkgver//_/-}.tar.bz2")
md5sums=('ba2868d3613b6e242f779e2dfd343193')

package() {
          cd "ESBTL-${pkgver//_/-}"
          mkdir -p "$pkgdir/usr/include/"
          cp -r include/ESBTL/ "$pkgdir/usr/include/"
}
