# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=owncloud-app-spreed.me
pkgver=0.1.6
pkgrel=1
pkgdesc="spreed.memail integration for owncloud"
arch=('any')
url="https://apps.owncloud.com/content/show.php/Spreed.ME?content=174436"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://apps.owncloud.com/CONTENT/content-files/174436-spreedme.tar.gz")
md5sums=('1e286c1bc4fc826129a6ac96384bad39')

prepare() {
  cd ${srcdir}/spreedme
  rm -f .DS_Store
}

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/spreedme ${pkgdir}/usr/share/webapps/owncloud/apps/spreedme
}
