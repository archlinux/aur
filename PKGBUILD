# Maintainer: Christian Steinhaus <aur@anwarias.de>
# Contributor: Christian Steinhaus <aur@anwarias.de>

pkgname=nextcloud-app-end_to_end_encryption
pkgver=1.0.5
pkgrel=1
pkgdesc="Nextcloud End-to-End-Encryption App"
arch=('any')
url="https://github.com/nextcloud/end_to_end_encryption"
license=('AGPLv3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/end_to_end_encryption/releases/download/v${pkgver}/end_to_end_encryption-${pkgver}.tar.gz")
sha512sums=("85d9169e1684dbc1f5b2279b22f1ab3ebf6fecd8499061a99236cdf3478c7499b9a27bb36d2f6bbcab9e35735fe155268406ec337fa1bbe02d97d73c513e35a7")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/end_to_end_encryption" "${pkgdir}/usr/share/webapps/nextcloud/apps/end_to_end_encryption"
}
