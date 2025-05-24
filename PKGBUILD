# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='tulizu'
pkgver='0.3'
pkgrel='1'
pkgdesc='View and customize ASCII art included /etc/issue files'
arch=('any')
url="https://github.com/loh-tar/$pkgname"
license=('GPL')
depends=('bash')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('043764002bbc42049db72ad1b4e9a5a6')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}
