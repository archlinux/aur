# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-development-utility
pkgver=3
pkgrel=1
pkgdesc="An extension that provides utilities to help with GNOME Shell extensions development"
arch=("any")
url="https://github.com/maoschanz/gnome-extension-development-utility"
license=("GPL")
depends=("gnome-shell")
conflicts=("gnome-shell-extension-development-utility-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('adb0e49ee3d80d806400c8920b297270')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/gnome-extension-development-utility-$pkgver/extension-development-utility@maestroschan.fr" "$_"
}
