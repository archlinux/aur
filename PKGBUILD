# Maintainer: Polichronucci <nick at discloud dot eu> 

pkgname=owncloud-app-announcementcenter
pkgver=1.1.1
pkgrel=1
pkgdesc="An Announcement Center app for ownCloud"
arch=('any')
url="https://github.com/owncloud/announcementcenter"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/announcementcenter/archive/v1.1.1.tar.gz")
sha512sums=("e4544398081d0e31115c98fae80d6ed59226f0c0bfcc557321c48a8ef47deca8b1aaa0b2bbcc640eba857c068dcc1500c73f34fcb27eb8ea16fa66b05cb40363")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/announcementcenter-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/announcementcenter"
}
