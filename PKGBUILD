# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-development-utility
pkgver=2
pkgrel=1
pkgdesc="An extension that provides utilities to help with GNOME Shell extensions development"
arch=("any")
url="https://github.com/maoschanz/gnome-extension-development-utility"
license=("GPL")
depends=("gnome-shell")
conflicts=("gnome-shell-extension-development-utility-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=("befb01c84162d97345ce171947074aa8")

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/gnome-extension-development-utility-$pkgver/extension-development-utility@maestroschan.fr" "$_"
}
