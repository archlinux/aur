# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=smarty3
pkgver=3.1.21
pkgrel=1
pkgdesc='Smarty is a PHP template engine'
url='http://www.smarty.net'
license='LGPL'
depends=('php>=5.2')
arch=('any')
source=("http://www.smarty.net/files/Smarty-${pkgver}.tar.gz")
sha256sums=('e872f98a194a31b9dea710fceb308431c0e2b846e46ce845b547f54e5789c465')

package() {
    install -d "${pkgdir}/usr/share/php"
    cp -dpr --no-preserve=ownership "${srcdir}/Smarty-${pkgver}/libs" "${pkgdir}/usr/share/php/smarty3"
}
