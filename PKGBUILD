# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-social
pkgver=0.2.101
pkgrel=1
pkgdesc="federated social network"
arch=('any')
url="https://apps.nextcloud.com/apps/social"
license=('GPL')
depends=('nextcloud>=16.0.0')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/social/releases/download/v$pkgver/social-$pkgver.tar.gz")
sha256sums=('4f0e25d368e470f1ea61c50c2e83a1487be048dc74a0cce497faf64b29446f02')

package() {
  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -a "${srcdir}"/social "${pkgdir}"/usr/share/webapps/nextcloud/apps/social
}
