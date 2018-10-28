# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-hotel-manager
pkgver=5
pkgrel=1
pkgdesc="Gnome Shell extension to manage Hotel development servers"
arch=("any")
url="https://github.com/hardpixel/hotel-manager"
license=("GPL")
depends=("gnome-shell" "curl")
provides=("gnome-shell-extension-hotel-manager")
conflicts=("gnome-shell-extension-hotel-manager-git")
source=("$pkgname-$pkgver::https://github.com/hardpixel/hotel-manager/archive/v$pkgver.tar.gz")
md5sums=("6196c356a15b485a2f0c34a8a8de0425")

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"

  cd "$srcdir/hotel-manager-$pkgver"
  cp -af "hotel-manager@hardpixel.eu" "$pkgdir/usr/share/gnome-shell/extensions/"
}
