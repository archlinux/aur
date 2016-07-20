# Maintainer: Polichronucci <nick at discloud dot eu> 

pkgname=owncloud-app-announcementcenter
pkgver=9.0.4
pkgrel=1
pkgdesc="An Announcement Center app for ownCloud"
arch=('any')
url="https://github.com/owncloud/announcementcenter"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/announcementcenter/archive/v${pkgver}.tar.gz")
sha512sums=('db3e03d1124a2ac248d7944218abbec88c201f01d735baba5662fc8a141ec646741745278fc1c7bbdd30fad31c45c9e0725cc02057c098182ea3549c6ee43842')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/announcementcenter-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/announcementcenter"
}
