# Contributor: Daniel YC Lin <dlin <at> gmail.com>
pkgname=upgradepic
pkgver=1
pkgrel=3
pkgdesc="A script to show pacman full system upgrade in SVG picture"
arch=('any')
url="http://aur.archlinux.org"
license="CDDL"
depends=('gnuplot')
optdepends=('chromium: for display svg file')
source=(upgradepic.sh)

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin
  install -c upgradepic.sh $pkgdir/usr/bin
}
md5sums=('923383169c55c9a62cce5fc213c25d8a')
