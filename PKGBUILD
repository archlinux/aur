# Maintainer: Jonas Frei <freijon@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-passman
pkgver=2.2.1
pkgrel=1
pkgdesc="Passman is a full featured password manager"
arch=('any')
url="https://github.com/nextcloud/passman"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-passman-${pkgver}.tar.gz::https://releases.passman.cc/passman_${pkgver}.tar.gz")
sha512sums=("75e61910bf11cbc632da04cf107230f6c94a15965663e3660717e8eb98c211c08cceaecea92d7a0bc3d3b2979216791188d56be334761dc696638cbcead0eb8e")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/passman" "${pkgdir}/usr/share/webapps/nextcloud/apps/passman"
}
