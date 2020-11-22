# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=nextcloud-app-user-external
pkgver=1.0.0
pkgrel=1
pkgdesc=" External user authentication methods like IMAP, SMB and FTP"
arch=('any')
url="https://github.com/nextcloud/user_external"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-user-external-${pkgver}.tar.gz::https://github.com/nextcloud/user_external/releases/download/v${pkgver}/user_external-${pkgver}.tar.gz")
sha256sums=("11405eaca332dac9af06702c1aa357be61362df4cd24746fdd24d0f7eebdf231")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/user_external" "${pkgdir}/usr/share/webapps/nextcloud/apps/user_external"
}
