# Maintainer: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>
# Contributor: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>

pkgname=nextcloud-app-direct_menu
pkgver=0.9.2
pkgrel=1
pkgdesc="Provide easy access to all apps in the header for NextCloud"
arch=('any')
url="https://github.com/juliushaertl/direct_menu/"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/juliushaertl/direct_menu/releases/download/v${pkgver}/direct_menu.tar.gz")
sha512sums=("4196bab35710a4627193e52e58f453c8ab090c98da31c51ec32953a0c3b7fd5dcca9647cf275c9459a00a7d154ff7099923e23983dee0e63e049993eeff282d7")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/direct_menu" "${pkgdir}/usr/share/webapps/nextcloud/apps/direct_menu"
}
