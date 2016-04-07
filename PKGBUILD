# Maintainer: Polichronucci <nick at discloud dot eu> 

pkgname=owncloud-app-announcementcenter
pkgver=9.0.1
pkgrel=1
pkgdesc="An Announcement Center app for ownCloud"
arch=('any')
url="https://github.com/owncloud/announcementcenter"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/announcementcenter/archive/v${pkgver}.tar.gz")
sha512sums=('c044e292593d2615b1aa3656e6eae992a891527215fa94fddfc487ca625c5642db3944d073d496879f5946f82d692de47f22f3da8630d14a79bee6261d923943')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/announcementcenter-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/announcementcenter"
}
