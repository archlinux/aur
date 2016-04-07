# Maintainer: Polichronucci <nick at discloud dot eu> 

pkgname=owncloud-app-notifications
pkgver=9.0.1
pkgrel=1
pkgdesc="An app that notifies the user about important events of other apps"
arch=('any')
url="https://github.com/owncloud/notifications"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/notifications/archive/v${pkgver}.tar.gz")
sha512sums=('b23afe1b9b807c36a358a1e9919bb73fc445f3c76e83c9b66d5603b09c5aac529f037b362a4b7db08c6b5f3a2e1ade020e79d414af8a54941470f4252f85e60b')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/notifications-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/notifications"
}
