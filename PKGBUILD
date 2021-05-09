# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=keeweb-desktop-bin
pkgver=1.18.3
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
sha256sums=("f11ea66583a161cdb40a165e560209f31d8a1086b0d28383e5ff8f9e9dfdda39")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
