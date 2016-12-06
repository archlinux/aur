# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-mail
pkgver=0.6.1
pkgrel=1
pkgdesc="An email app for NextCloud"
arch=('any')
url="https://github.com/nextcloud/mail"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/mail/releases/download/v${pkgver}/mail.tar.gz")
sha512sums=("68696a5b84d27822b44bcb4d3c9377f2aca755e9db44d6d279f083138663ee43bd4c1a46f6762e86747849851f865dba4aa0973bd98e69c50e2db51cc08aef79")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/mail" "${pkgdir}/usr/share/webapps/nextcloud/apps/mail"
}
