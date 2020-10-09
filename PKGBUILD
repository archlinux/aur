# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-github
pkgver=0.0.5
pkgrel=1
pkgdesc="GitHub integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_github"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_github/releases/download/v${pkgver}/integration_github-${pkgver}.tar.gz")
sha512sums=('159029ed661e73d5a646e0bed53e91004043366f7b0839d779e8e3ce8a1c862bf7d29489c676f4520b86d62b9810e4b7c8c56b407b9c9dcbbdad3f57899cdeaf')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_github" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_github"
}
