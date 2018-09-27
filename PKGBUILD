# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-news
pkgver=13.0.1
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/nextcloud/news"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-news-${pkgver}.tar.gz::https://github.com/nextcloud/news/releases/download/${pkgver}/news.tar.gz")
sha512sums=("3e65fd4dd52bd4b59d6e1c5567453a2f2668692cef9837bf45708c7eacdbfc78ed4bdf737df959eb35f34c13d6bd7e3448bc15c30766ecefd2dfe638929a0453")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/news" "${pkgdir}/usr/share/webapps/nextcloud/apps/news"
}
