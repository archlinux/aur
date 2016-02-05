# Maintainer: Oguzcan Kucukbayrak <oguz@okb1100.com>

pkgname=shadow-icon-theme
pkgver=1.5
pkgrel=1
pkgdesc="This is a flat icon-theme Gnome 3.10+. The icons have colourful circular base with long shadow. "
arch=(any)
url="http://gnome-look.org/content/show.php/Shadow?content=170398"
license=(GPL3)
source=("https://github.com/rudrab/Shadow/archive/v${pkgver}.tar.gz")
md5sums=("0fa373f29e77ded61acf58b5ccaad103")

package() { 
  install -d "${pkgdir}"/usr/share/icons/
  tar -xf v${pkgver}.tar.gz
  cp -r Shadow-${pkgver}/ "${pkgdir}"/usr/share/icons/
}
