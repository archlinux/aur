# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-unite
pkgver=36
pkgrel=1
pkgdesc="Unite makes GNOME Shell look like Ubuntu Unity Shell"
arch=("any")
url="https://github.com/hardpixel/unite-shell"
license=("GPL")
depends=("gnome-shell" "xorg-xprop")
optdepends=("gnome-shell-extension-dash-to-dock")
provides=("gnome-shell-extension-unite")
conflicts=("gnome-shell-extension-unite-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("53a9c624723be3058bf27ca3548f9840")

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/unite-shell-$pkgver/unite@hardpixel.eu" "$_"
}
