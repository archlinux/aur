# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=6.0.4
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("https://github.com/owncloud/news/archive/${pkgver}.tar.gz")
sha512sums=("475f7df7f16787ac1ea200d4eeb6717317ce0ba975819f739f624cf5366bf5dcac5d029151e76d90e6965aa44c010465df0f6135fd62ad04f58760c596a3e288")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
