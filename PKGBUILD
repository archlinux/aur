# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-hotel-manager
pkgver=12
pkgrel=1
pkgdesc="Gnome Shell extension to manage Hotel development servers"
arch=("any")
url="https://github.com/hardpixel/hotel-manager"
license=("GPL")
depends=("gnome-shell")
provides=("gnome-shell-extension-hotel-manager")
conflicts=("gnome-shell-extension-hotel-manager-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("4a5b352eb478ef6fcb8ea1eef34228a9")

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/hotel-manager-$pkgver/hotel-manager@hardpixel.eu" "$_"
}
