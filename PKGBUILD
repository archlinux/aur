# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-podcast
pkgver=0.0.1
pkgrel=1
pkgdesc="Selfhosted podcast manager for your personal cloud"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-podcast"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-podcast-${pkgver}.tar.gz::https://git.project-insanity.org/onny/nextcloud-app-podcast/-/jobs/1012/artifacts/raw/build/artifacts/podcast.tar.gz")
sha512sums=('93594ea2fe870b297b7a4ff329d4c59d9cced0cad4b8c8c0be2f3679563227bd20b53d52cf90aa70148fa763c5028c56f8245ffc9283be3bc5b3ca2774f9ac79')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/podcast" "${pkgdir}/usr/share/webapps/nextcloud/apps/podcast"
}
