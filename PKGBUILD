# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=contao-lts
pkgver=3.5.12
pkgrel=1
pkgdesc="small yet powerful Content Management System (CMS) based on php, LTS version"
url="https://contao.org"
arch=('any')
license=('LGPL')
depends=('php' 'php-gd' 'mysql')
optdepends=('php-mcrypt: data encryption')
#conflicts="contao"
install=${pkgname}.install
source=("contao-${pkgver}.tar::https://download.contao.org/$pkgver/tar"
        "${pkgname}.install")
md5sums=('c776e8898cebbac4d1d66527eef24706'
         'd8536f9c9a77cbbbcce86cb1931c5c5a')
 
package() {
    install -d "${pkgdir}/usr/webapps/contao-lts"
    cp -R "$srcdir/contao-${pkgver}/"* "${pkgdir}/usr/webapps/contao-lts"
}
