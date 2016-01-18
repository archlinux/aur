# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=7.0.0
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("https://github.com/owncloud/news/archive/${pkgver}.tar.gz")
sha512sums=("ddd5919c5b4b7760ac37a917ffa4f5bf027e37f7c380015d2708983ab8f3f8d0cf99f4e8a495fdb48cf3602ffb7aec2d1b589a47451e7c67911c4608ae72533d")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
