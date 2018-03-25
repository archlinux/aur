# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-unite
pkgver=14
pkgrel=1
pkgdesc="Unite makes GNOME Shell look like Ubuntu Unity Shell"
arch=("any")
url="https://github.com/hardpixel/unite-shell"
license=("GPL")
depends=("gnome-shell" "xorg-xprop")
optdepends=("gnome-shell-extension-dash-to-dock")
provides=("gnome-shell-extension-unite")
conflicts=("gnome-shell-extension-unite-git")
source=("$pkgname-$pkgver::https://github.com/hardpixel/unite-shell/archive/v$pkgver.tar.gz")
md5sums=("b152025dbb9bff78cd4dcb5f433dcb06")

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"

  cd "$srcdir/unite-shell-$pkgver"
  cp -af "unite@hardpixel.eu" "$pkgdir/usr/share/gnome-shell/extensions/"
}
