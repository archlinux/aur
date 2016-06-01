# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-mail
pkgver=0.5.1
pkgrel=1
pkgdesc="An email app for ownCloud"
arch=('any')
url="https://github.com/owncloud/mail"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/mail/releases/download/v$pkgver/mail.tar.gz")
sha512sums=("6a6f8a8eb5d373dc8c14d057a376569105044a29ea316df5383d1a6de59c7e61400ff7c8d044d26d8d37d7877f5cc9f65e00e912db3e303c2e51ab0be095bd1b")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/mail" "${pkgdir}/usr/share/webapps/owncloud/apps/mail"
}
