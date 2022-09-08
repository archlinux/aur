# Maintainer: Robert Brzozowski <robson75@linux.pl>
# Maintainer: Lara Maia <dev@lara.click>
# co-Maintainer: Acidhub <contact@acidhub.click>
# co-Maintainer: bobi
# Contributer: Jean-Alexandre Anglès d'Auriac <jagw40k@free.fr>

pkgname=buuf-icon-theme
pkgdesc="Created by fana-m. Icons by mattahan. Modified by Hybrid Son Of Oxayotl"
pkgver=3.34
pkgrel=3
arch=('any')
url="http://buuficontheme.free.fr"
license=('cc-by-nc-sa')
depends=('hicolor-icon-theme')

source=("https://github.com/robson-66/Buuf/archive/refs/tags/v3.34.tar.gz")
sha256sums=('35bf7618c4e0731b6596834e7c6d3718012196c6c2c71b21336162d57a2b8159')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/
  cp -rf "$srcdir"/Buuf* "$pkgdir"/usr/share/icons/

  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}
