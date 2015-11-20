# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=asciiplanes
pkgver=0.04
pkgrel=1
pkgdesc="Find the planes' positions on a grid. (text-based game)"
arch=('any')
url="https://github.com/trizen/asciiplanes"
license=('GPLv3')
depends=('sidef' 'perl-text-asciitable')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('775a0473cc237217cfd566e6ce0869b8a8e30bb0cdd3139289b373b3a393abfe')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
