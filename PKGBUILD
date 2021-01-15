# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-github
pkgver=0.0.16
pkgrel=1
pkgdesc="GitHub integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_github"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_github/releases/download/v${pkgver}/integration_github-${pkgver}.tar.gz")
sha512sums=('471715ad42dee0e26d94c9542a31c80badbd66d5b7bf388bc9fdcaedad345548e0da4964da2cdd1b3c7af59ebdc75dd1da359c78bf29ce7942206193a68e6073')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_github" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_github"
}
