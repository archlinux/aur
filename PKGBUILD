# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=gnome-shell-theme-macos-mojave
pkgver=v1
pkgrel=1
pkgdesc="Mojave-like theme for gnome-shell"
url="https://www.opendesktop.org/s/Gnome/p/1215571/"
arch=(any)
depends=('gnome-shell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/julthon/gnome-shell-theme-macos-mojave/releases/download/$pkgver/gnome-shell-theme-macos-mojave_$pkgver.tar.gz")
md5sums=('650704547c0116922fba2a1c0b9e2f7b')

package() {
  _instdir="$pkgdir/usr/share/themes"
  mkdir -p $_instdir
  cp -dpr --no-preserve=ownership "$srcdir/Mojave Light" "$_instdir/Mojave Light"
  cp -dpr --no-preserve=ownership "$srcdir/Mojave Dark" "$_instdir/Mojave Dark"
}

