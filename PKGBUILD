# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-github
pkgver=0.0.14
pkgrel=1
pkgdesc="GitHub integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_github"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_github/releases/download/v${pkgver}/integration_github-${pkgver}.tar.gz")
sha512sums=('fc25b027cd14fda1d96c38bc1e5611d77acb6f0859c7c116d15df6b84ffaf5599f77dea28a45cbac596a9468ebff64ad2c1da348b0462024aaa814f9fe730249')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_github" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_github"
}
