# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=0.4.6
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://gitlab.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-cospend-${pkgver}.tar.gz::https://gitlab.com/eneiluj/cospend-nc/-/archive/v${pkgver}/cospend-nc-v${pkver}.tar.gz")
sha512sums=('c69f952da5597acb337fb18b9e45022694a9d9681650111dee1a8d5366a05207188576fae80754a3de494e1109992d6173b8dde12adb38a5b5a116289b7f6a3f')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
  tar -xvf "${srcdir}/nextcloud-app-cospend-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
}
