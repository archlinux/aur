# Maintainer: Lara Maia <dev@lara.click>
# co-Maintainer: Acidhub <contact@acidhub.click>
# Contributer: Jean-Alexandre Anglès d'Auriac <jagw40k@free.fr>

pkgname=buuf-icon-theme
pkgdesc="An icon theme for Gnome based on the Buuf iconset by Mattahan"
pkgver=3.22
pkgrel=1

arch=('any')
url="http://buuficontheme.free.fr"
license=('cc-by-nc-sa')

depends=('hicolor-icon-theme')
replaces=("buuficontheme")

source=(http://buuficontheme.free.fr/buuf$pkgver.tar.xz)
md5sums=('76d819920479f1df2cf01a9b56a0240a')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/$pkgname/
  cp -rf "$srcdir"/buuf$pkgver/* "$pkgdir"/usr/share/icons/$pkgname/
}
