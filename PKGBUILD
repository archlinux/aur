# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=nextcloud-app-user-external
pkgver=0.7.0
pkgrel=1
pkgdesc=" External user authentication methods like IMAP, SMB and FTP"
arch=('any')
url="https://github.com/nextcloud/user_external"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-user-external-${pkgver}.tar.gz::https://github.com/nextcloud/user_external/releases/download/v${pkgver}/user_external-${pkgver}.tar.gz")
sha256sums=("f27267e78bd81ac23e7608d4b06a3c5e562c77b29d1fe7ebbca8dcb262eab001")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/user_external" "${pkgdir}/usr/share/webapps/nextcloud/apps/user_external"
}
