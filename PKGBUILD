# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=arch-upgrade
pkgver=1.20
pkgrel=1
pkgdesc="Desktop app to upgrade your Arch Linux system"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("curl" "xmlstarlet" "python-unidecode")
optdepends=("zenity: popups if run in GUI mode"
            "wmctrl: required if zenity installed")
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
install=install.sh
md5sums=('49c10cb653cbe9d30219d775dcb1f88b')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
