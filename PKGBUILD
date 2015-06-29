# Maintainer: Sfincs <sfincs120 [at] gmail [dot] com>

pkgname=trisquel-icon-theme
pkgver=7.0_4
pkgrel=1
pkgdesc="Trisquel GNU/Linux icon theme, based on Gnome Brave icon theme"
url="http://trisquel.info"
arch=('any')
license=('GPL')
depends=(gnome-colors-icon-theme)
optdepends=()
makedepends=()
backup=()
install=''
source=("http://archive.trisquel.info/trisquel/pool/main/t/trisquel-icon-theme/trisquel-icon-theme_${pkgver/_/-}.tar.gz")
md5sums=('743e6142f42022cdb81f9a62df7c46fc')
         
package() {

   install -dm755 $pkgdir/usr/share/icons
   cp -r $srcdir/trisquel-icon-theme/data/usr/share/icons/trisquel $pkgdir/usr/share/icons/

}
