# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=contao
pkgver=4.8.7
pkgrel=1
pkgdesc="small yet powerful Content Management System (CMS) based on php"
url="https://contao.org"
arch=('any')
license=('LGPL')
depends=('php' 'php-gd' 'mysql')
optdepends=('php-mcrypt: data encryption')
install=${pkgname}.install
source=("https://github.com/contao/contao/archive/${pkgver}.tar.gz"
        "${pkgname}.install")
sha512sums=('bfaede730e3da7b316a018591313a2afc070aa1c2bfad125cf6270247d37b6a4a43a0a5da5c786f2c8ee6b8250f9d6b41e662ac16717f35dc4e6bee63fa14b5c'
            'b22cd5c5aa89ccde6077f8d8955cb3f2d12a4fca26bc6b9b4e26d80a6fad9c0a3255d3b308b5798ad29b9ce7c5f526eb7872c6c7314833fad7a7dce791a98d51')
 
package() {
    install -d "${pkgdir}/usr/share/webapps/contao"
    cp -R "$srcdir/contao-${pkgver}/"* "${pkgdir}/usr/share/webapps/contao"
}
