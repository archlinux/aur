# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=trisquel-gtk-theme
pkgver=7.0_8
pkgrel=1
pkgdesc="Trisquel GNU/Linux gtk theme, A GTK2/3, metacity and xfwm4 theme for Trisquel"
url="http://trisquel.info"
arch=('any')
license=('GPL')
depends=('gdk-pixbuf2' 'gtk-engine-murrine' 'gtk-engine-unico')
optdepends=()
makedepends=()
backup=()
install=''
source=("http://archive.trisquel.info/trisquel/pool/main/t/trisquel-gtk-theme/trisquel-gtk-theme_${pkgver/_/-}.tar.gz")
md5sums=('1342affa3a7342de76f04076eab2f4ea')
         
package() {
   install -dm755 ${pkgdir}/usr/share/themes
   cp -r ${srcdir}/trisquel-gtk-theme/data/usr/share/themes/Trisquel ${pkgdir}/usr/share/themes/
}
