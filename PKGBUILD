# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=macos-arc-white-theme
_pkgname=macOS-Arc-White
pkgver=1.10
pkgrel=1
pkgdesc="A flat theme for Cinnamon, GNOME, GTK+ 2, GTK+ 3, Pantheon, Unity and Xfce4"
arch=('i686' 'x86_64')
url="https://github.com/fusion809/macOS-Arc-White"
license=("GPL3")
optdepends=('plank' 'cinnamon' 'gnome-shell' 'gtk2' 'gtk3' 'xfce4')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('4abdcc7007e38c67d1721aede1c11fb4')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p $pkgdir/usr/share/themes/${_pkgname}
  mkdir -p $pkgdir/usr/share/plank/themes
  cp -r {cinnamon,gnome-shell,gtk-2.0,gtk-3.0,gtk-3.20,metacity-1,unity,xf*,index.theme} $pkgdir/usr/share/themes/${_pkgname}
  cp -r plank/* ${pkgdir}/usr/share/plank/themes
}
