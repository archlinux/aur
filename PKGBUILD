# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=arch-upgrade
pkgver=1.13
pkgrel=1
pkgdesc="Desktop app to upgrade your Arch Linux system"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("curl" "xmlstarlet" "python-unidecode")
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
install=install.sh
md5sums=('364c0e1f80f060f0c579a430e122c973')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
