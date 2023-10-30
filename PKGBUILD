# $Id: PKGBUILD 103944 2014-01-13 20:31:53Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-app-social
pkgver=0.6.1
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
sha256sums=('e66c30df589bc209d2893b9368aa3932781b84f230f25c0bb75b644324a67ab6')

package() {
  install -d "${pkgdir}"/usr/share/webapps/nextcloud/apps
  cp -a "${srcdir}"/social "${pkgdir}"/usr/share/webapps/nextcloud/apps/social
}
