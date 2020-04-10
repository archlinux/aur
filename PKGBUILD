# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Previous Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-cospend
pkgver=0.4.5
pkgrel=1
pkgdesc="Shared budget manager Nextcloud app"
arch=('any')
url="https://gitlab.com/eneiluj/cospend-nc"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-cospend-${pkgver}.tar.gz::https://gitlab.com/eneiluj/cospend-nc/-/archive/v${pkgver}/cospend-nc-v${pkver}.tar.gz")
sha512sums=('dc0965beaf8f30657e2cdd08acfe545d5edf3b074580a87e4befcb0d4cf1c725998eb51ddb90a475c56b439a3e30f0c98640efb892073b12a175d691c06335be')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
  tar -xvf "${srcdir}/nextcloud-app-cospend-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/usr/share/webapps/nextcloud/apps/cospend"
}
