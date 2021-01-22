# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-github
pkgver=0.0.17
pkgrel=1
pkgdesc="GitHub integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_github"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_github/releases/download/v${pkgver}/integration_github-${pkgver}.tar.gz")
sha512sums=('ba43c4867e255f4ea3788b79c3863894624e6f5b422b142fff5ffbd094ed79857f7f90931c899a1a348a78124536296b2dcc3d680926c255bd8bab25b0e9e310')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_github" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_github"
}
