# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-impersonate
pkgver=1.7.0
pkgrel=1
pkgdesc="Allow administrators to become a different user by adding an impersonate action to the user list"
arch=('any')
url="https://apps.nextcloud.com/apps/impersonate"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/impersonate/releases/download/v$pkgver/impersonate.tar.gz")
sha256sums=('cd43a620531e35a955349f8362112a6b768d3500647bddd45714f0c0d269389c')

package() {
  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -a "${srcdir}"/impersonate "${pkgdir}"/usr/share/webapps/nextcloud/apps/impersonate
}
