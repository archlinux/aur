# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-social
pkgver=0.4.1
pkgrel=1
pkgdesc="federated social network"
arch=('any')
url="https://apps.nextcloud.com/apps/social"
license=('GPL')
depends=('nextcloud>=16.0.0')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/social/releases/download/v$pkgver/social-$pkgver.tar.gz")
sha256sums=('a79af87bcd39825b1e32a1e482c842e034cf6711781c001554ad42ac9b5df31a')

package() {
  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -a "${srcdir}"/social "${pkgdir}"/usr/share/webapps/nextcloud/apps/social
}
