# Maintainer: Oguzcan Kucukbayrak <oguz@okb1100.com>

pkgname=shadow-icon-theme
pkgver=1.5.1
pkgrel=1
pkgdesc="This is a flat icon-theme Gnome 3.10+. The icons have colourful circular base with long shadow. "
arch=(any)
url="http://gnome-look.org/content/show.php/Shadow?content=170398"
license=(GPL3)
source=("git+https://github.com/rudrab/Shadow")
md5sums=("SKIP")

package() {
    install -d "$pkgdir"/usr/share/icons/
    cp -r Shadow/ "$pkgdir"/usr/share/icons/
}
