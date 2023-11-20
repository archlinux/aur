# Maintainer: Robert Brzozowski <robson75@linux.pl>
# Maintainer: Lara Maia <dev@lara.click>
# co-Maintainer: Acidhub <contact@acidhub.click>
# co-Maintainer: bobi
# Contributer: Jean-Alexandre Anglès d'Auriac <jagw40k@free.fr>

pkgname=buuf-icon-theme
pkgdesc="Created by fana-m. Icons by mattahan. Modified by Hybrid Son Of Oxayotl"
pkgver=3.45
pkgrel=0
arch=('any')
url="http://buuficontheme.free.fr"
license=('cc-by-nc-sa')
depends=('hicolor-icon-theme')

source=("https://github.com/robson-66/Buuf/archive/refs/heads/master.zip")
sha256sums=('SKIP')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/
  cp -R "$srcdir"/Buuf*/ "$pkgdir"/usr/share/icons/Buuf/

  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}