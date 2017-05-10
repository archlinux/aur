# Maintainer: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>
# Contributor: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>

pkgname=nextcloud-app-direct_menu
pkgver=0.10.2
pkgrel=1
pkgdesc="Provide easy access to all apps in the header for NextCloud"
arch=('any')
url="https://github.com/juliushaertl/direct_menu/"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/juliushaertl/direct_menu/releases/download/v${pkgver}/direct_menu.tar.gz")
sha512sums=("48ab0c792f07c87efb5d737e4e98e9999dc6c9c00ea15e373fc17aa15e88b3566f96b7a70d0a3d2d3cb94efdbc419432911cecc5d4b3ed2aad1f889075896742")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/direct_menu" "${pkgdir}/usr/share/webapps/nextcloud/apps/direct_menu"
}
