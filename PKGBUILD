# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-news
pkgver=13.1.4
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/nextcloud/news"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-news-${pkgver}.tar.gz::https://github.com/nextcloud/news/releases/download/${pkgver}/news.tar.gz")
sha512sums=("ddc5257b9c1a404726bebe853b95fef65f5dd0b71fce052e1860a2dcd1fe40afa28fcb79c749bfd1dfe27419553d5d83d522f1e4ebc30bfa0a805aa2ec838b34")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/news" "${pkgdir}/usr/share/webapps/nextcloud/apps/news"
}
