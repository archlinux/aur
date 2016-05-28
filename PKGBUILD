# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-mail
pkgver=0.5.0
pkgrel=1
pkgdesc="An email app for ownCloud"
arch=('any')
url="https://github.com/owncloud/mail"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/mail/releases/download/v$pkgver/mail.tar.gz")
sha512sums=("693cdb162568b07696ce73132d63acdcbe64f1e48778acc294faa727cd5a2d0aa8264563dde947c59bfe6151091c5048fbe1895c852f81d798307a2d0cd6883c")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/mail" "${pkgdir}/usr/share/webapps/owncloud/apps/mail"
}
