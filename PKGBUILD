# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=arch-upgrade
pkgver=1.4
pkgrel=1
pkgdesc="Desktop app to upgrade your Arch Linux system"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python-html2text")
backup=("etc/$pkgname.conf")
source=("$url/archive/$pkgver.tar.gz")
install=install.sh
md5sums=('1e5f591d2b3c4d80a651a3bad5cd3a17')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
