# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-contacts
pkgver=1.5.3
pkgrel=1
pkgdesc="Contacts app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/contacts"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/contacts/releases/download/v${pkgver}/contacts.tar.gz")
sha512sums=("ad6c2cbfa62674d43b8efa1b588e92804f1677cde401b95525e428f059f46a6bd7edb218c5c371e914efeb38c953eb7a1fb0a5e8a6b6fc53aa9ce313b8d0fc5a")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/contacts" "${pkgdir}/usr/share/webapps/nextcloud/apps/contacts"
}
