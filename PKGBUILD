# Author:  Half-Left  <http://half-left.deviantart.com/>
# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=gtk3-theme-sonar
pkgver=20111112
pkgrel=2
pkgdesc="An OpenSUSE green GTK3 theme by Half-Left, shipped with an Adwaita blue version and GTK2 and metacity variants" 
url="http://half-left.deviantart.com/art/Sonar-GTK3-254801661"
license=('GPLv3')
arch=('any')
depends=('gtk3')
makedepends=('unzip')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://fc05.deviantart.net/fs70/f/2011/306/5/8/sonar___gtk3_by_half_left-d47pa7x.zip")

md5sums=('07f600fd24cd18983dc49875c5a5c67c')



package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  unzip ${srcdir}/Sonar-3.2.zip -d ${pkgdir}/usr/share/themes/
  chmod 755 ${pkgdir}/usr/share/themes/Sonar-3.2
}


