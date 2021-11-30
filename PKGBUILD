# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=nextcloud-app-user-external
pkgver=2.1.0
pkgrel=1
pkgdesc=" External user authentication methods like IMAP, SMB and FTP"
arch=('any')
url="https://github.com/nextcloud/user_external"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-user-external-${pkgver}.tar.gz::https://github.com/nextcloud/user_external/releases/download/v${pkgver}/user_external-${pkgver}.tar.gz")
sha256sums=("79d400c05737ea3512faf0ab77411dd5da9c830341e59b1a98b86775c92acf19")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/user_external" "${pkgdir}/usr/share/webapps/nextcloud/apps/user_external"
}
