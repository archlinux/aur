# Maintainer: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>
# Contributor: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>

pkgname=nextcloud-app-direct_menu
pkgver=0.10.1
pkgrel=1
pkgdesc="Provide easy access to all apps in the header for NextCloud"
arch=('any')
url="https://github.com/juliushaertl/direct_menu/"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/juliushaertl/direct_menu/releases/download/v${pkgver}/direct_menu.tar.gz")
sha512sums=("e70994cd59b7100df587787fd68be98163c87aa745ae857d32eca2b5f9b1aca5e059e74f58c037fd7c38819067aa96f3ca2b8b6899cd3edd4fddbb055628ff65")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/direct_menu" "${pkgdir}/usr/share/webapps/nextcloud/apps/direct_menu"
}
