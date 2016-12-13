# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-news
pkgver=10.1.0
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/nextcloud/news"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-news-${pkgver}.tar.gz::https://github.com/nextcloud/news/releases/download/${pkgver}/news.tar.gz")
sha512sums=("eaf77483dff7adbc24fe4de3d7019b80fa7c0dabc132d0f45cee9bf77e6f2635151e9c9c3abf22ee6bcab62552d76374ae73b2e3433a7cf9f2242ed823b8304b")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/news" "${pkgdir}/usr/share/webapps/nextcloud/apps/news"
}
