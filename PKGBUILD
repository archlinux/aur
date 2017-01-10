# Maintainer: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>
# Contributor: Anxo Beltrán <anxo.beltran.alvarez@gmail.com>

pkgname=nextcloud-app-direct_menu
pkgver=0.10.0
pkgrel=1
pkgdesc="Provide easy access to all apps in the header for NextCloud"
arch=('any')
url="https://github.com/juliushaertl/direct_menu/"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/juliushaertl/direct_menu/releases/download/${pkgver}/direct_menu.tar.gz")
sha512sums=("60227b4440c5380958b0d699e2e1500e7d148ff871f18fe83974e407c99351e1f2d9997819cfec6eaa101a76cff41774306e1e73f1e23a5cc3e62a9b36e13bf3")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/direct_menu" "${pkgdir}/usr/share/webapps/nextcloud/apps/direct_menu"
}
