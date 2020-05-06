# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=0.4.9
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://gitlab.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-cospend-${pkgver}.tar.gz::https://gitlab.com/eneiluj/cospend-nc/-/archive/v${pkgver}/cospend-nc-v${pkver}.tar.gz")
sha512sums=('a1340f6896f99b89677bf20cf8b91d1b6a460ec5d18f87aad22224ed2dcadbc13c683ad4bb2f9101c14d7f383308fa7a299123e6a502f11c81746ce489b55622')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
  tar -xvf "${srcdir}/nextcloud-app-cospend-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
}
