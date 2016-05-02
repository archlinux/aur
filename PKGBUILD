# Maintainer: zoe <chp321@gmail.com>

pkgname=bikexperience
pkgver=5.1.7
pkgrel=3
pkgdesc="Software for outdoor training planning and gpx-track-management"
arch=('any')
url="http://www.bikexperience.de/"
license=('GPL')
depends=('java-runtime')
optdepends=('rxtx: for serial connection with bike computers')
source=('http://www.bikexperience.de/download/bikeXperience.jar' 'bikeXperience.desktop' 'bxpicon.png' 'bikeXperience')
md5sums=(
 SKIP
'e39b65991ed6494626aa2c50e97d8445'
'51830fb6b0fb7d5cd2e74ef7f697d222'
'a4753c4961b997c79d27d7ea7d85e040')
                    
package() {
 mkdir -p $pkgdir/opt/${pkgname} $pkgdir/usr/share/applications $pkgdir/usr/share/icons/hicolor/100x100/apps/ $pkgdir/usr/bin/
 install -D -m 755 $srcdir/bikeXperience.jar $pkgdir/opt/${pkgname}/
 install -D $startdir/bikeXperience.desktop $pkgdir/usr/share/applications/
 install -D $startdir/bxpicon.png $pkgdir/usr/share/icons/hicolor/100x100/apps/
 install -D $startdir/bikeXperience $pkgdir/usr/bin/
}
