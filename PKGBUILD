# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-mail
pkgver=0.4.1
pkgrel=1
pkgdesc="An email app for ownCloud"
arch=('any')
url="https://github.com/owncloud/mail"
license=('AGPL')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/mail/releases/download/v$pkgver/mail.tar.gz")
sha512sums=("9cc10c3cd9985e3387971c6fa530bdaedbd60867758f22519aa3d2628302ee605d873e0fa449cf60758d720a761eafa13357f63602772b32fb20e34d692069a1")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/mail" "${pkgdir}/usr/share/webapps/owncloud/apps/mail"
}
