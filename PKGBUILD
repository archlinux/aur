# Maintainer: Polichronucci <nick at discloud dot eu> 

pkgname=owncloud-app-announcementcenter
pkgver=9.0.3
pkgrel=1
pkgdesc="An Announcement Center app for ownCloud"
arch=('any')
url="https://github.com/owncloud/announcementcenter"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/announcementcenter/archive/v${pkgver}.tar.gz")
sha512sums=('6e4b9c4516fd21fa9ea0c24eb705926bb9d60478100f95046318cd2484d26ccd295e2076a1bdb23c4f7f957861ba0a197b35ce29c10fdfec3584a2aa3c1b94fb')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/announcementcenter-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/announcementcenter"
}
