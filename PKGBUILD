# Maintainer: Jonas Frei <freijon@gmail.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-passman
pkgver=2.1.1
pkgrel=1
pkgdesc="Passman is a full featured password manager"
arch=('any')
url="https://github.com/nextcloud/passman"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-passman-${pkgver}.tar.gz::https://github.com/nextcloud/passman/archive/${pkgver}.tar.gz")
sha512sums=("a835b143c2eb443ad12d31c7684d99d803c372b90d501b7f0d2ca489c5aeec2092163e8e89954dcc8de0eb4be683e2910dd58ff8b29ad4dd13a6501a6b328fb1")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/passman-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/passman"
}
