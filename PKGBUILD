# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=keeweb-desktop-bin
pkgver=1.17.3
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
sha256sums=("63b0121a4daf76f3569263061da6ca93b03fe678325e61a5ef6ebf1a723b389d")

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mv usr "$pkgdir"
}
