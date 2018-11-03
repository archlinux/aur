# Maintainer: Julian Thonhauser <julthon@gmail.com>
pkgname=gtk-theme-macos-mojave
pkgver=v1
pkgrel=1
pkgdesc="Mojave-like theme for gtk2/gtk3"
url="https://github.com/julthon/mojave-gtk-theme"
license=("GPL2")
arch=(any)
depends=('gtk3' 'gtk-engine-murrine' 'gnome-shell>=3.30')
source=("$pkgname-$pkgver.tar.gz::https://github.com/julthon/gtk-theme-macos-mojave/releases/download/$pkgver/gtk-theme-macos-mojave_$pkgver.tar.gz")
md5sums=('09ef1c28d3af4ef103b88d2f821b14ca')

package() {
  _instdir="$pkgdir/usr/share/themes"
  mkdir -p $_instdir
  cp -dpr --no-preserve=ownership "$srcdir/McOS-MJV-3.30" "$_instdir/Mojave Light"
  cp -dpr --no-preserve=ownership "$srcdir/McOS-MJV-Dark-mode-Gnome-3.30" "$_instdir/Mojave Dark"
}

