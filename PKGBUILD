# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=smarty3
pkgver=3.1.30
pkgrel=1
pkgdesc='Smarty is a PHP template engine'
url='http://www.smarty.net'
license=('LGPL')
depends=('php>=5.2')
arch=('any')
source=("https://github.com/smarty-php/smarty/archive/v${pkgver}.tar.gz")
sha256sums=('62461370c73fb3eb315c6a0a55f9bdbb04d115a0e3eaf46d76d68336524f344f')

package() {
    install -d "${pkgdir}/usr/share/php"
    cp -dpr --no-preserve=ownership "${srcdir}/smarty-${pkgver}/libs" "${pkgdir}/usr/share/php/smarty3"
}
