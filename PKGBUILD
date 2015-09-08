# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=6.0.3
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("https://github.com/owncloud/news/archive/${pkgver}.tar.gz")
sha512sums=("c328175994f2d9cfaffc6d43ee8e25b1e5fb86f04b2f1b20251e1a369cb650df79dec059c57a8cc6c2dc9305aef4f64c5b273f5685b42cab18d15c7b62c2ae81")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
