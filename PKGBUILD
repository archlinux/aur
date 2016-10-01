# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-news
pkgver=9.0.4
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/nextcloud/news"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-news-${pkgver}.tar.gz::https://github.com/nextcloud/news/releases/download/${pkgver}/news.tar.gz")
sha512sums=("7feb7a6755cfcb93e5e8172aa7fcf02045eff387a0ab41a5d7c0db96dd20925d224d9ccee56839545689eea3161603d8b0874bfb37245042bd9b2f4894f987d2")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/news" "${pkgdir}/usr/share/webapps/nextcloud/apps/news"
}
