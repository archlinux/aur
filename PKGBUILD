# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-hotel-manager
pkgver=4
pkgrel=1
pkgdesc="Gnome Shell extension to manage Hotel development servers"
arch=("any")
url="https://github.com/hardpixel/hotel-manager"
license=("GPL")
depends=("gnome-shell")
provides=("gnome-shell-extension-hotel-manager")
conflicts=("gnome-shell-extension-hotel-manager-git")
source=("$pkgname::https://github.com/hardpixel/hotel-manager/archive/v$pkgver.tar.gz")
md5sums=("dbc0483d7ac054335bf26eca0bb91605")

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"

  cd "$srcdir/hotel-manager-$pkgver"
  cp -af "hotel-manager@hardpixel.eu" "$pkgdir/usr/share/gnome-shell/extensions/"
}
