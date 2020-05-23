# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=0.5.4
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://gitlab.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-cospend-${pkgver}.tar.gz::https://gitlab.com/eneiluj/cospend-nc/-/archive/v${pkgver}/cospend-nc-v${pkgver}.tar.gz")
sha512sums=('1c628e400f4dfec04c55d58448fc51bb901eac0d7e4491889cd09876a98346990e401340be3c0273a133a13b4b3fce1db6c00b2d1ade8a628039b855e0cb2dde')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
  tar -xvf "${srcdir}/nextcloud-app-cospend-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
}
