# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=asciiplanes
pkgver=0.05
pkgrel=1
pkgdesc="Find the planes' positions on a grid. (text-based game)"
arch=('any')
url="https://github.com/trizen/asciiplanes"
license=('GPL3')
depends=('sidef>=2.30' 'perl-text-asciitable')

source=("${pkgname}-$pkgver.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0fbe6376ffea6737ffd1e21832957dcf06225b73ab749242013ef147f5706a5c')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
