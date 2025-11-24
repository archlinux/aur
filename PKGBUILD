# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=nextcloud-app-user-external
pkgver=3.4.0
pkgrel=1
pkgdesc=" External user authentication methods like IMAP, SMB and FTP"
arch=('any')
url="https://github.com/nextcloud/user_external"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud-releases/user_external/releases/download/v${pkgver}/user_external-v${pkgver}.tar.gz")
sha256sums=('5a7fbed5da3cbe335f753027b662179c92c17fb37babc875e9e285d8a13d47f3')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/user_external" "${pkgdir}/usr/share/webapps/nextcloud/apps/user_external"
}
