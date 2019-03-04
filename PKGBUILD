# Maintainer: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=nextcloud-app-user-sql
pkgver=4.3.0
pkgrel=1
pkgdesc="App for authenticating Nextcloud users using SQL"
arch=('any')
url="https://github.com/nextcloud/user_sql"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-user-sql-${pkgver}.tar.gz::https://github.com/nextcloud/user_sql/releases/download/v${pkgver}/user_sql-${pkgver}.tar.gz")
sha256sums=("804d69aa6a9c90b487ba0d8d54a87da5adae2a02b053471e670f111e0b8b47f6")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/user_sql" "${pkgdir}/usr/share/webapps/nextcloud/apps/user_sql"
}
