# Maintainer: Lara Maia <lara@craft.net.br>
# Contributer: Jean-Alexandre Anglès d'Auriac <jagw40k@free.fr>

pkgname=buuf-icon-theme
pkgdesc="An icon theme for Gnome based on the Buuf iconset by Mattahan"
pkgver=3.10
pkgrel=2

arch=('any')
url="http://buuficontheme.free.fr"
license=('cc-by-nc-sa')

depends=('hicolor-icon-theme')
replaces=("buuficontheme")

source=(http://buuficontheme.free.fr/buuf$pkgver.tar.xz)
md5sums=('1d8c9c16557252bfe9b090076988503a')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/$pkgname/
  cp -rf "$srcdir"/buuf$pkgver/* "$pkgdir"/usr/share/icons/$pkgname/
}
