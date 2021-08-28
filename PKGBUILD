# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-impersonate
pkgver=1.9.0
pkgrel=1
pkgdesc="Allow administrators to become a different user by adding an impersonate action to the user list"
arch=('any')
url="https://apps.nextcloud.com/apps/impersonate"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud-releases/impersonate/releases/download/v$pkgver/impersonate.tar.gz")
sha256sums=('125fdf45a9d525c0aba8c9e2945fe943b9a2e02f7a4e9fdc5aa059ad42ef3c64')

package() {
  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -a "${srcdir}"/impersonate "${pkgdir}"/usr/share/webapps/nextcloud/apps/impersonate
}
