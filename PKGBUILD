# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=nextcloud-app-user-external
pkgver=3.0.0
pkgrel=1
pkgdesc=" External user authentication methods like IMAP, SMB and FTP"
arch=('any')
url="https://github.com/nextcloud/user_external"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud-releases/user_external/releases/download/v${pkgver}/user_external-v${pkgver}.tar.gz")
sha256sums=("25cd717780993091bac9e76f81c01fad02a1844917d2ac3973481f93a31ff276")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/user_external" "${pkgdir}/usr/share/webapps/nextcloud/apps/user_external"
}
