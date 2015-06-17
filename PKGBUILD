# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=asciiplanes
pkgver=0.02
pkgrel=1
pkgdesc="Find the planes' positions on a grid. (text-based game)"
arch=('any')
url="https://github.com/trizen/asciiplanes"
license=('GPLv3')
depends=('sidef' 'perl-text-asciitable')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('759c91e358aaa99b9ed92c727c9578eb996ec0cfeaafa71ef90cbcfd9cd23413')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
