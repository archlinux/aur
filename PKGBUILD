# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=8.0.0
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("owncloud-app-news-${pkgver}.tar.gz::https://github.com/owncloud/news/archive/${pkgver}.tar.gz")
sha512sums=("dabfe4475e68167d3b346146ebc17ae979ae02b0c638e4100013fa05738d963f3029f1ee1a638e32eb0c0084b14026a9c283e407c93bb20a7c92fdb4bd3e85d9")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
