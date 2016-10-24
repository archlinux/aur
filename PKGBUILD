# Maintainer: Oguzcan Kucukbayrak <oguz@okb1100.com>

pkgname=shadow-icon-theme
pkgver=2.2.2
pkgrel=1
pkgdesc="This is a flat icon-theme Gnome 3.10+. The icons have colourful circular base with long shadow. "
arch=(any)
url="http://gnome-look.org/content/show.php/Shadow?content=170398"
license=(GPL3)
source=("https://dl.opendesktop.org/api/files/download/id/1473335366/shadow-${pkgver}.tar.xz")
md5sums=('d0b4df239435ef4f5139de8165409fcc')

package() { 
  install -d "${pkgdir}"/usr/share/icons/
  tar -xf shadow-${pkgver}.tar.xz
  cp -r shadow/ "${pkgdir}"/usr/share/icons/
}
