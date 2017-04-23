# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=asciiplanes
pkgver=0.06
pkgrel=1
pkgdesc="Find the planes' positions on a grid. (text-based game)"
arch=('any')
url="https://github.com/trizen/asciiplanes"
license=('GPL3')
depends=('sidef>=3.00' 'perl-text-asciitable')

source=("${pkgname}-$pkgver.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1ac124f603269318b075a0aaa32cb3cf4c6ed3d57a20e0bf58aa4b3f82dd6ac2')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
