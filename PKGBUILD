# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=0.5.2
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://gitlab.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-cospend-${pkgver}.tar.gz::https://gitlab.com/eneiluj/cospend-nc/-/archive/v${pkgver}/cospend-nc-v${pkgver}.tar.gz")
sha512sums=('ac6655f7894f3e5c608fcd5c53c352dc0b19ca8cffbf780c2120683480f84a3ab1ae6879a2bf5aad479a18fee9fba48d019fbc2816c51fc4c2df79df1eab6218')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
  tar -xvf "${srcdir}/nextcloud-app-cospend-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
}
