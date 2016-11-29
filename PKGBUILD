# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Aliaksiej Artamonaŭ <aliaksiej.artamonau@gmail.com>

pkgname=java-bluecove
pkgver=2.1.0
pkgrel=3
pkgdesc='JSR-82 Java implementation'
arch=('i686' 'x86_64')
url='http://bluecove.org/'
license=('APACHE' 'GPL3')
depends=('java-runtime' 'bluez' 'bluez-libs')

source=(http://downloads.sourceforge.net/sourceforge/bluecove/bluecove-${pkgver}.jar
        http://downloads.sourceforge.net/sourceforge/bluecove/bluecove-gpl-${pkgver}.jar)
noextract=(bluecove-${pkgver}.jar
           bluecove-gpl-${pkgver}.jar)
md5sums=('a0119cb381b42aa09018c7092cfdbe4e'
         '78304a5e7f8913d561b67ff9d17ef4de')

package() {
    install -d -m755 ${pkgdir}/usr/share/java/bluecove/
    install -m644 \
        ${srcdir}/bluecove-${pkgver}.jar \
        ${pkgdir}/usr/share/java/bluecove/bluecove.jar
    install -m644 \
        ${srcdir}/bluecove-gpl-${pkgver}.jar \
        ${pkgdir}/usr/share/java/bluecove/bluecove-gpl.jar
}
