# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-news
pkgver=13.1.6
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/nextcloud/news"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-news-${pkgver}.tar.gz::https://github.com/nextcloud/news/releases/download/${pkgver}/news.tar.gz")
sha512sums=("9f67eb49a12285c614712f2361788d274837d553db6cbb4fe56e37902666bfa512f6ec9c1524f524ec13a3d2c753ca17b036fd558d6294a631a5e1ceae7dfae5")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/news" "${pkgdir}/usr/share/webapps/nextcloud/apps/news"
}
