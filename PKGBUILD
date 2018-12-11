# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-social
pkgver=0.1.0
pkgrel=1
pkgdesc="federated social network"
arch=('any')
url="https://apps.nextcloud.com/apps/social"
license=('GPL')
depends=('nextcloud>=15.0.0')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/social/releases/download/v$pkgver/social-$pkgver.tar.gz")
sha256sums=('f8b2d6db3866066a7576920bba92c0db3f20aeb787811c40e889dfacdc80a303')

package() {
  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -a "${srcdir}"/social "${pkgdir}"/usr/share/webapps/nextcloud/apps/social
}
