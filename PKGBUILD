# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-contacts
pkgver=1.5.2
pkgrel=1
pkgdesc="Contacts app for Nextcloud"
arch=('any')
url="https://github.com/owncloud/contacts"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/contacts/releases/download/v${pkgver}/contacts.tar.gz")
sha512sums=("7a845cd6edb1d56e7a568b4f47d139b19b952f6fcd5dbf5ca4af8bcfdfac59b74560befdfacebe9609d56d6edc74cb968e3c89ccaab8feb21090f311ec3e3044")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/contacts" "${pkgdir}/usr/share/webapps/nextcloud/apps/contacts"
}
