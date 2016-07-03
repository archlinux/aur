# Maintainer: Lara Maia <lara@craft.net.br>
# Contributer: Jean-Alexandre Anglès d'Auriac <jagw40k@free.fr>

pkgname=buuf-icon-theme
pkgdesc="An icon theme for Gnome based on the Buuf iconset by Mattahan"
pkgver=3.20
pkgrel=1

arch=('any')
url="http://buuficontheme.free.fr"
license=('cc-by-nc-sa')

depends=('hicolor-icon-theme')
replaces=("buuficontheme")

source=(http://buuficontheme.free.fr/buuf$pkgver.tar.xz)
md5sums=('22de777d816f58575c3a245db7e93cc6')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/$pkgname/
  cp -rf "$srcdir"/buuf$pkgver/* "$pkgdir"/usr/share/icons/$pkgname/
}
