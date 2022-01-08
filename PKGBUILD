# Maintainer: Daniel Maier <ifany.net@protonmail.com>

pkgname=makehuman-plugin-mhx
pkgver=latest
pkgrel=3
pkgdesc="MHX (blender/makehuman interchange format) exporter for makehuman"
arch=('any')
url="http://www.makehumancommunity.org/"
license=('GPLv2')
depends=('makehuman')
conflicts=('makehuman-community-plugins')
source=("https://download.tuxfamily.org/makehuman/plugins/mhx-mh-latest.zip")
#looks like being (currently) daily updated, even the latest one
#relying on direct version numbering broken the other day
sha512sums=('SKIP')

prepare(){
  cd $srcdir
  mv README.md 9_export_mhx2
}

package() {
  install -d "$pkgdir/opt/makehuman/plugins"
  mv "$srcdir/9_export_mhx2" "$pkgdir/opt/makehuman/plugins"
}
