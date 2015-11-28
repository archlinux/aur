# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=smart-units
pkgver=0.04
pkgrel=1
pkgdesc="A pretty clever command-line units converter. (written in Sidef)"
arch=('any')
url="https://github.com/trizen/smart-units"
license=('GPLv3')
depends=('sidef')

source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('964703ee815cfde14d639abb457bda6358396372b4bed46c5ee70a51c52e799d')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D "$pkgname.sf" "$pkgdir/usr/bin/$pkgname"
}
