# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-mail
pkgver=0.4.4
pkgrel=1
pkgdesc="An email app for ownCloud"
arch=('any')
url="https://github.com/owncloud/mail"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/mail/releases/download/v$pkgver/mail.tar.gz")
sha512sums=("50343316631d162bd5d4aafe3cee742a2ff1800275632a9a8d1dff077e3bde41160111173a6ccfb9f39dddf74d43a11d61af6f6fa273bbb2aee34ad8dfa0d294")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/mail" "${pkgdir}/usr/share/webapps/owncloud/apps/mail"
}
