# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>
pkgname=qtermwidget-nord
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Nord colourscheme for the Qt terminal widget, used by QTerminal"
arch=('any')
url="http://lxqt.org/"
license=('GPL')
depends=('qtermwidget')
source=("Nord.colorscheme")
md5sums=('e6da4c01c097138d16b3511472cac545')

package() {
  mkdir -p "$pkgdir/usr/share/qtermwidget5/color-schemes"
  install -m644 "$srcdir/Nord.colorscheme" "$pkgdir/usr/share/qtermwidget5/color-schemes/Nord.colorscheme"
}
