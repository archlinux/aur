# Maintainer: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>
# Contributor: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>

pkgname=nextcloud-app-direct_menu
pkgver=0.9.3
pkgrel=1
pkgdesc="Provide easy access to all apps in the header for NextCloud"
arch=('any')
url="https://github.com/juliushaertl/direct_menu/"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/juliushaertl/direct_menu/releases/download/${pkgver}/direct_menu.tar.gz")
sha512sums=("468d32f4e290ba48fa306a21ece4f5a358f40926cd1ab2c6783f27e86a349d04123a0f67ef7b2e26736d10f3b70111806d7b4ee8ce6f2c95020befdee3bd5c48")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/direct_menu" "${pkgdir}/usr/share/webapps/nextcloud/apps/direct_menu"
}
