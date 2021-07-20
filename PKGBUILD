# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=keeweb-desktop-bin
pkgver=1.18.7
pkgrel=1
pkgdesc="Free cross-platform password manager compatible with KeePass"
arch=("x86_64")
url="https://github.com/keeweb/keeweb"
license=("MIT")
depends=("gnome-keyring" "libxss" "gconf" "libappindicator-gtk2")
optdepends=("xdotool: for Auto-type feature")
provides=("keeweb")
conflicts=("keeweb-desktop" "keeweb" "keeweb-bin" "keeweb-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/KeeWeb-$pkgver.linux.x64.deb")
sha256sums=("fd4faf9f94cb214f7f27a711163b807721b39700b4e26a782f65f6113a7e6521")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
