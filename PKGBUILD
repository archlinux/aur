# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=keeweb-desktop-bin
pkgver=1.6.3
pkgrel=2
pkgdesc="Free cross-platform password manager compatible with KeePass"
arch=("x86_64")
url="https://github.com/keeweb/keeweb"
license=("MIT")
depends=("gconf" "libxss")
provides=("keeweb-desktop")
conflicts=("keeweb-desktop" "keeweb" "keeweb-bin" "keeweb-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/KeeWeb-$pkgver.linux.x64.deb")
md5sums=("2d3bd08a027b27ae5d49e9a68ddd203f")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
