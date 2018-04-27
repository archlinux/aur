# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from https://aur.archlinux.org/packages/nextcloud-app-ocsms/
# Original contributors:
# Contributor: Polichronucci <nick at discloud dot eu>

pkgname=nextcloud-app-ocsms
pkgver=1.21.2
pkgrel=2
pkgdesc="Push your Android SMS to your ownCloud instance."
arch=('any')
url="https://apps.nextcloud.com/apps/ocsms"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/ocsms/archive/$pkgver.tar.gz")
sha512sums=('dfb96be8545835a2eee234d16fbe69b5bf5b87430fca1ce73cd253ffb8c491da787005abf0210f68f7cb9632164f6ac3f5897d83b7307f01e773ab46cf9bd6cf')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/ocsms-$pkgver" "${pkgdir}/usr/share/webapps/nextcloud/apps/ocsms"
}
