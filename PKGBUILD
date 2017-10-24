# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='tulizu'
pkgver='0.2'
pkgrel='1'
pkgdesc='View and customize ASCII art included /etc/issue files'
arch=('any')
url="https://github.com/loh-tar/$pkgname"
license=('GPL')
depends=('bash')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('1e11eaf1f5ad7fc530a2e9d7b424f6f2')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
