pkgname=nextcloud-app-ldap_contacts_backend
pkgver=1.0.1
pkgrel=1
pkgdesc="LDAP backend for Contacts"
arch=('any')
url="https://github.com/nextcloud/ldap_contacts_backend"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/ldap_contacts_backend/releases/download/v$pkgver/ldap_contacts_backend.tar.gz")
sha256sums=('b90e2c32262dea40ad1645734ce24175e3e87801588205ea5484c0c65d340e2a')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/ldap_contacts_backend" "${pkgdir}/usr/share/webapps/nextcloud/apps/ldap_contacts_backend"
}
