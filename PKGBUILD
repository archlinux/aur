# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=libinput-gestures
pkgver=2.80
pkgrel=1
pkgdesc="Actions gestures on your touchpad using libinput"
url="https://github.com/bulletmark/$pkgname"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python>=3.5" "libinput" "hicolor-icon-theme")
optdepends=("wmctrl: required for _internal command, as per default configuration"
            "xdotool: simulates keyboard and mouse actions for Xorg or XWayland based apps")
conflicts=("$pkgname-git")
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
install="install.sh"
md5sums=('1188563705733338b955bbea05b54a53')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
