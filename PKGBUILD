# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=nextcloud-app-user-external
pkgver=0.5.1
pkgrel=1
pkgdesc=" External user authentication methods like IMAP, SMB and FTP"
arch=('any')
url="https://github.com/nextcloud/user_external"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-user-external-${pkgver}.tar.gz::https://github.com/nextcloud/user_external/releases/download/v${pkgver}/user_external-${pkgver}.tar.gz")
sha256sums=("f2dcc4977a1fd8705767add9f8d41fa56761ad8d5c6c76973e6d216cfb7d7aab")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/user_external" "${pkgdir}/usr/share/webapps/nextcloud/apps/user_external"
}
