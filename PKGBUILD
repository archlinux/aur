# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-mail
pkgver=0.6.0
pkgrel=1
pkgdesc="An email app for NextCloud"
arch=('any')
url="https://github.com/nextcloud/mail"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/mail/releases/download/v${pkgver}/mail.tar.gz")
sha512sums=("45440a5f2b19af862ece12cbaee49ca15457d39f84c28d11bebe503aaf74a13ebe2480dfc0b34730639664a9701bea2668c712300d4cdc3e3107b29db6f345ef")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/mail" "${pkgdir}/usr/share/webapps/nextcloud/apps/mail"
}
