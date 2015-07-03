# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=asciiplanes
pkgver=0.03
pkgrel=1
pkgdesc="Find the planes' positions on a grid. (text-based game)"
arch=('any')
url="https://github.com/trizen/asciiplanes"
license=('GPLv3')
depends=('sidef' 'perl-text-asciitable')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('57105412acab7b8de28503d27e5f56b3b0d9a47f760aeaef2186a05a27987547')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
