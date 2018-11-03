# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=gnome-shell-theme-macos-mojave
pkgver=v1
pkgrel=3
pkgdesc="Mojave-like theme for gnome-shell"
url="https://www.opendesktop.org/s/Gnome/p/1215571/"
arch=(any)
depends=('gnome-shell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/julthon/gnome-shell-theme-macos-mojave/releases/download/$pkgver/gnome-shell-theme-macos-mojave_$pkgver.tar.gz")
md5sums=('f09079227dfa02abe91bfcf9d24c0f92')

package() {
  _instdir="$pkgdir/usr/share/themes"
  mkdir -p $_instdir
  mkdir -p "$_instdir/Mojave Light"
  mkdir -p "$_instdir/Mojave Dark"
  cp -dpr --no-preserve=ownership "$srcdir/Mojave Light/gnome-shell" "$_instdir/Mojave Light"
  cp -dpr --no-preserve=ownership "$srcdir/Mojave Dark/gnome-shell" "$_instdir/Mojave Dark"
}

