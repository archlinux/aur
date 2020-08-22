# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=nextcloud-app-user-external
pkgver=0.10.0
pkgrel=1
pkgdesc=" External user authentication methods like IMAP, SMB and FTP"
arch=('any')
url="https://github.com/nextcloud/user_external"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-user-external-${pkgver}.tar.gz::https://github.com/nextcloud/user_external/releases/download/v${pkgver}/user_external-${pkgver}.tar.gz")
sha256sums=("bcbb2d4fb96d0b592c68a847b4caf47ab44ffae51baa96b5aea2ad5c8a908e28")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/user_external" "${pkgdir}/usr/share/webapps/nextcloud/apps/user_external"
}
