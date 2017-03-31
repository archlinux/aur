# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=arch-upgrade
pkgver=1.8
pkgrel=1
pkgdesc="Desktop app to upgrade your Arch Linux system"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("curl python-html2text")
backup=("etc/$pkgname.conf")
source=("$url/archive/$pkgver.tar.gz")
install=install.sh
md5sums=('15ace7a5624fcc5abff8ac24120b9d7d')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
