# Maintainer: Christian Steinhaus <aur@anwarias.de>
# Contributor: Christian Steinhaus <aur@anwarias.de>

pkgname=nextcloud-app-end_to_end_encryption
pkgver=1.1.0
pkgrel=1
pkgdesc="Nextcloud End-to-End-Encryption App"
arch=('any')
url="https://github.com/nextcloud/end_to_end_encryption"
license=('AGPLv3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/end_to_end_encryption/releases/download/v${pkgver}/end_to_end_encryption-${pkgver}.tar.gz")
sha512sums=("cbef0e8cbe647ad9ee8e4ce7a38626b0e365689741f715222a59d26bdce4f1edf4300a34e53ee2da791f2a994e28907971015c0e508f767b5e20b174e769b0fa")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/end_to_end_encryption" "${pkgdir}/usr/share/webapps/nextcloud/apps/end_to_end_encryption"
}
