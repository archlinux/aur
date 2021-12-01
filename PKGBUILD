# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-impersonate
pkgver=1.10.0
pkgrel=1
pkgdesc="Allow administrators to become a different user by adding an impersonate action to the user list"
arch=('any')
url="https://apps.nextcloud.com/apps/impersonate"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud-releases/impersonate/releases/download/v$pkgver/impersonate-v$pkgver.tar.gz")
sha256sums=('3aad8f0d27cd8408d7130789923791d4134f54748f7268052117b4484745d90c')

package() {
  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -a "${srcdir}"/impersonate "${pkgdir}"/usr/share/webapps/nextcloud/apps/impersonate
}
