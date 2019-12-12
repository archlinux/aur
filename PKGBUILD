# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=arch-upgrade
pkgver=1.17
pkgrel=1
pkgdesc="Desktop app to upgrade your Arch Linux system"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("curl" "xmlstarlet" "python-unidecode")
optdepends=("zenity" "wmctrl")
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
install=install.sh
md5sums=('16d85a7c7c9ea219bb713dcb9b4c48a0')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
