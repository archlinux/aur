# Maintainer: Polichronucci <nick at discloud dot eu> 

pkgname=owncloud-app-announcementcenter
pkgver=9.1.2
pkgrel=1
pkgdesc="An Announcement Center app for ownCloud"
arch=('any')
url="https://github.com/owncloud/announcementcenter"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/announcementcenter/archive/v${pkgver}.tar.gz")
sha512sums=('cf39151b8e199c4921b471b9b402791e31a46c784ec8c67b24fe0fbef6729c161d2df767d21472319537e4ed72cc277ac6abd8b320eff8173bc8dbd0bf5219fc')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/announcementcenter-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/announcementcenter"
}
