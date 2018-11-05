# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=gtk-theme-macos-mojave
pkgver=v1
pkgrel=2
pkgdesc="Mojave-like theme for GTK2/GTK3"
url="https://github.com/julthon/mojave-gtk-theme"
license=("GPL2")
arch=(any)
depends=('gtk3' 'gtk-engine-murrine')
optdepends=('gnome-shell>=3.30: theme was specifically tuned for GNOME 3.30')
source=("$pkgname-$pkgver.tar.gz::https://github.com/julthon/gtk-theme-macos-mojave/releases/download/$pkgver/gtk-theme-macos-mojave_$pkgver.tar.gz")
sha512sums=('f225395d8a742b2325860931e8db78cad4b687700e9af68269c1228ab4b332fb4b291830b089eda76eb9ac77dfb79527b09afdfe580c32dcc4cb96777db337b4')

package() {
  _instdir="$pkgdir/usr/share/themes"
  mkdir -p $_instdir
  cp -dpr --no-preserve=ownership "$srcdir/McOS-MJV-3.30" "$_instdir/Mojave Light"
  cp -dpr --no-preserve=ownership "$srcdir/McOS-MJV-Dark-mode-Gnome-3.30" "$_instdir/Mojave Dark"
}

