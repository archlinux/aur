# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=keeweb-desktop-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Free cross-platform password manager compatible with KeePass"
arch=("x86_64")
url="https://github.com/keeweb/keeweb"
license=("MIT")
depends=("gconf" "libxss" "libappindicator-gtk2")
provides=("keeweb-desktop")
conflicts=("keeweb-desktop" "keeweb" "keeweb-bin" "keeweb-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/KeeWeb-$pkgver.linux.x64.deb")
md5sums=("29cd2e6b9748422e2f8c9102ad63ad0c")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
