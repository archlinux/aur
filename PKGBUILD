# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname=w3
pkgver=0.2.0
pkgrel=1
pkgdesc="$pkgname: the wee weechat wrapper"
url="https://github.com/qguv/$pkgname"
arch=('any')
license=('GPL')
depends=('weechat' 'python')
source=("https://github.com/qguv/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9deb8cb6d7c95e7fe0e132a2aa90be085bf42b739605d10951fd5280b3dcc559')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  install -Dt "$pkgdir/usr/bin/" "$pkgname"
}
