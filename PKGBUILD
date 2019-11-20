# Maintainer: zoe <chp321@gmail.com>

pkgname=bikexperience
pkgver=5.7.0
pkgrel=2
pkgdesc="Software for outdoor training planning and gpx-track-management"
arch=('any')
url="http://www.bikexperience.de/"
license=('GPL')
depends=('java-runtime>=7' 'unzip')
optdepends=('rxtx: for serial connection with bike computers')
source=(
"http://www.bikexperience.de/download/bXp-${pkgver}-common-install.zip"
"bikeXperience.desktop"
"bikeXperience")

md5sums=(
'22f3d5a0eb8ebe326a62413bae223c6e'
'd56366efca3c206e2ba319bd7bd92b65'
'606fa88e3b6040d0eb6963203e5cff2b')
                
package() {
 install -D -m644 -t ${pkgdir}/usr/share/applications/               ${startdir}/bikeXperience.desktop
 install -D -m755 -t ${pkgdir}/usr/bin/                              ${startdir}/bikeXperience 
 install -D -m755 -t ${pkgdir}/usr/share/java/${pkgname}/            ${srcdir}/bikeXperience.jar 
 install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/100x100/apps/ ${srcdir}/linux/bxpIcon.png 
}
