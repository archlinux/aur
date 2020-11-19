# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ten-hands-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Simplest way to organize and run tasks"
arch=('x86_64')
url='https://tenhands.app'
depends=('gtk3'
         'nss')
license=('MIT')
provides=('ten-hands')
source=("${pkgname}-${pkgver}.deb::https://github.com/saisandeepvaddi/ten-hands/releases/download/v${pkgver}/ten-hands-app_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/saisandeepvaddi/ten-hands/raw/master/LICENSE')
sha256sums=('98990cc5088ae35becf0360a3e6906728ebca809b5b249598751d5658e7551fd'
            '6b30b7530e47b208e4da08c8813ca52c63aae00d74d0b2036548069f59588d02')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
