# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-social
pkgver=0.7.0
pkgrel=1
pkgdesc="federated social network"
arch=('any')
url="https://apps.nextcloud.com/apps/social"
license=('GPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
#source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud/social/releases/download/v$pkgver/social-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tgz::https://github.com/nextcloud-releases/social/releases/download/v$pkgver/social-v$pkgver.tar.gz")
sha256sums=('50d52efd5e64d4885002682e6b9b89316b4a483b80dbcb77797a76b1a2affc2c')

package() {
  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -a "${srcdir}"/social "${pkgdir}"/usr/share/webapps/nextcloud/apps/social
}
