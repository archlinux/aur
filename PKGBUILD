# Maintainer: Jonas Frei <freijon@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-passman
pkgver=2.1.4
pkgrel=1
pkgdesc="Passman is a full featured password manager"
arch=('any')
url="https://github.com/nextcloud/passman"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-passman-${pkgver}.tar.gz::https://releases.passman.cc/passman_${pkgver}.tar.gz")
sha512sums=("1c82dc87f357d6b22bc641558e934edb55c4766e779c05df77357c20e7916591ddbd654ab0779303433c20cb42339c2c56a6e47527f8aa2e9f15ee972d31c4ce")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/passman" "${pkgdir}/usr/share/webapps/nextcloud/apps/passman"
}
