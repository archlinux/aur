# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-contacts
pkgver=0.0.0.193
pkgrel=1
pkgdesc="Calendar App for Nextcloud"
arch=('any')
url="https://github.com/owncloud/contacts"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/contacts/releases/download/v$pkgver/contacts.tar.gz")
sha512sums=("7fce0e66333555ee22b362f475a6704be2ced55ffab73b176a080898947f240d4a8c107aa9a8c15c57f4bbad9e8d94bf361b3b4e3efbc4b320a10dcc65f20430")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/contacts" "${pkgdir}/usr/share/webapps/nextcloud/apps/contacts"
}
