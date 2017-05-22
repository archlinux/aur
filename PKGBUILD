# Maintainer: Jonas Frei <freijon@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-passman
pkgver=2.1.2
pkgrel=1
pkgdesc="Passman is a full featured password manager"
arch=('any')
url="https://github.com/nextcloud/passman"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-passman-${pkgver}.tar.gz::https://releases.passman.cc/passman_${pkgver}.tar.gz")
sha512sums=("4a382a1fc0aaaef16e36261be73124fe1c0a1e9a81705092bcd886696eab4633b571cbd04186e6e182d1660974408acd68ea916da121cf8cce68f9bb6d072366")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/passman" "${pkgdir}/usr/share/webapps/nextcloud/apps/passman"
}
