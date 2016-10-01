# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-mail
pkgver=0.5.3
pkgrel=1
pkgdesc="An email app for NextCloud"
arch=('any')
url="https://github.com/nextcloud/mail"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/mail/releases/download/v$pkgver/mail.tar.gz")
sha512sums=("25d552a181d8098264eeee8c0d29edafafadaaf3646c2d1b8a4046638212b22ba68edac67b31e9f045a736a5a825ec85dcd15226d933b9bbb8a848770ebcbd41")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/mail" "${pkgdir}/usr/share/webapps/nextcloud/apps/mail"
}
