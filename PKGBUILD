# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname=w3
pkgver=0.2.1
pkgrel=1
pkgdesc="$pkgname: the wee weechat wrapper"
url="https://github.com/qguv/$pkgname"
arch=('any')
license=('GPL')
depends=('weechat' 'python')
source=("https://github.com/qguv/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b9230235405923b22c800b0f5144d621a92726cb051a213de8c7ec166b20987c')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  install -Dt "$pkgdir/usr/bin/" "$pkgname"
}
