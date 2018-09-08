# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-radio
pkgver=0.6.3
pkgrel=1
pkgdesc="Listen to radio stations"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-radio"
license=('MIT')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-radio-${pkgver}.tar.gz::https://onny.project-insanity.org/files/nextcloud-app-radio-${pkgver}.tar.gz")
sha512sums=("bf8a82e1362dc1e59464643d5fe556bc55ed0d99a0eb147fd2eb2338f27a109d168623009e9293665f33dfab8a9a97f86b4af184afe1cba37e63dc0dd92004b3")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/radio" "${pkgdir}/usr/share/webapps/nextcloud/apps/radio"
}
