# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=keeweb-desktop-bin
pkgver=1.13.4
pkgrel=1
pkgdesc="Free cross-platform password manager compatible with KeePass"
arch=("x86_64")
url="https://github.com/keeweb/keeweb"
license=("MIT")
depends=("gconf" "libxss" "libappindicator-gtk2")
optdepends=("xdotool: for Auto-type feature")
provides=("keeweb-desktop")
conflicts=("keeweb-desktop" "keeweb" "keeweb-bin" "keeweb-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/KeeWeb-$pkgver.linux.x64.deb")
md5sums=("6b52fd1300706095b9541537a7cf716a")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
