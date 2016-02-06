# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='tulizu'
pkgver='0.1'
pkgrel='1'
pkgdesc='View and customize ASCII art included /etc/issue files'
arch=('any')
url="https://github.com/loh-tar/$pkgname"
license=('GPL')
depends=('bash')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('1f01bff06e26994baf545b9986e01c58')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
