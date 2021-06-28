# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-github
pkgver=1.0.1
pkgrel=1
pkgdesc="GitHub integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_github"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_github/releases/download/v${pkgver}/integration_github-${pkgver}.tar.gz")
sha512sums=('1cf6ad002f10e96fd57ae18fdd8a5cbb1e9119665f0e777c82c8e8d8408df95b687a11921d9079a03bb2ab76f768d218a7e79fa40fce09ade2a324ce314d109e')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_github" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_github"
}
