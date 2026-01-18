# Maintainer: zoe <chp321@gmail.com>

pkgname=bikexperience
pkgver=6.0.2
pkgrel=1
pkgdesc="Software for outdoor training planning and gpx-track-management"
arch=('any')
url="https://www.bikexperience.de/"
license=('GPL')
depends=('java-runtime>=23' 'unzip')
optdepends=('rxtx: for serial connection with bike computers')
source=(
"https://www.bikexperience.de/download/bXp-${pkgver}-common-install.zip"
"bikeXperience.desktop"
"bikeXperience")

md5sums=(
'1d5115042858bb8a9b1fc1eb07405806'
'd56366efca3c206e2ba319bd7bd92b65'
'606fa88e3b6040d0eb6963203e5cff2b')
                
package() {
 install -D -m644 -t ${pkgdir}/usr/share/applications/               ${startdir}/bikeXperience.desktop
 install -D -m755 -t ${pkgdir}/usr/bin/                              ${startdir}/bikeXperience 
 install -D -m755 -t ${pkgdir}/usr/share/java/${pkgname}/            ${srcdir}/bikeXperience.jar 
 install -D -m644 -t ${pkgdir}/usr/share/icons/hicolor/100x100/apps/ ${srcdir}/linux/bxpIcon.png 
}
