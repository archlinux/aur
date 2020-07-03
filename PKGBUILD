# Maintainer: Christian Steinhaus <aur@anwarias.de>
# Contributor: Christian Steinhaus <aur@anwarias.de>

pkgname=nextcloud-app-end_to_end_encryption
pkgver=1.5.0
pkgrel=1
pkgdesc="Nextcloud End-to-End-Encryption App"
arch=('any')
url="https://github.com/nextcloud/end_to_end_encryption"
license=('AGPLv3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/end_to_end_encryption/releases/download/v${pkgver}/end_to_end_encryption-${pkgver}.tar.gz")
sha512sums=('ecaabeadee469028465abca9a745148bd16f4ab202eea43b07a15edde85c7068bf4047c404f09d73ef3171afd16dbb59cd3b497c1a966ab3e2196b52a2f94929')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/end_to_end_encryption" "${pkgdir}/usr/share/webapps/nextcloud/apps/end_to_end_encryption"
}
