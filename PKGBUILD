# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-mail
pkgver=0.6.2
pkgrel=1
pkgdesc="An email app for NextCloud"
arch=('any')
url="https://github.com/nextcloud/mail"
license=('AGPL')
depends=('nextcloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextcloud/mail/releases/download/v${pkgver}/mail.tar.gz")
sha512sums=("fdb2e769be3369b541fc680edff5411efef3478c08fd706aaf2b544f8838cab295b9dcd5c58a085aa30d4223dc9d806b5b3272adc57f3d2d2eb4607afbc17686")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/mail" "${pkgdir}/usr/share/webapps/nextcloud/apps/mail"
}
