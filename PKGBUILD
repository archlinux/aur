# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-podcast
pkgver=0.3.1
pkgrel=1
pkgdesc="Selfhosted podcast manager for your personal cloud"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-podcast"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-podcast-${pkgver}.tar.gz::https://git.project-insanity.org/onny/nextcloud-app-podcast/-/jobs/1312/artifacts/raw/build/artifacts/podcast.tar.gz")
sha512sums=('6d5449e459f6c831c931d07414993cd8fc0187d7e804e2fad99f1ec4f5e6f31828e46787f7f759a3eb0c536a94374fd140297cbfa9db5c7309d1faff7eee2c71')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/podcast" "${pkgdir}/usr/share/webapps/nextcloud/apps/podcast"
}
