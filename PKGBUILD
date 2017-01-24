# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=contao
pkgver=4.3.4
pkgrel=1
pkgdesc="small yet powerful Content Management System (CMS) based on php"
url="https://contao.org"
arch=('any')
license=('LGPL')
depends=('php' 'php-gd' 'mysql')
optdepends=('php-mcrypt: data encryption')
install=${pkgname}.install
source=("contao-${pkgver}.tar::https://download.contao.org/$pkgver/tar"
        "${pkgname}.install")
md5sums=('af7c0ba6a423696a5b78fa43e39e0f55'
         'a79edf316b0d4e0862afdbca7dbcf23e')
 
package() {
    install -d "${pkgdir}/usr/share/webapps/contao"
    cp -R "$srcdir/contao-${pkgver}/"* "${pkgdir}/usr/share/webapps/contao"
}
