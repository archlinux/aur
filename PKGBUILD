# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname=w3
pkgver=0.3.0
pkgrel=2
pkgdesc="$pkgname: the wee weechat wrapper"
url="https://github.com/qguv/$pkgname"
arch=('any')
license=('GPL3')
depends=('weechat' 'python')
source=("https://github.com/qguv/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('53dfa609e6121c224c2eb2dc9c23d6fd7d1fe604943134bdd7af94103a75e286')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  install -Dt "$pkgdir/usr/bin/" "$pkgname"
}
