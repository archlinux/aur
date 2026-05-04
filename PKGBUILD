# Maintainer: Jed Liu <jed-aur.archlinux.org at litech dot org>

pkgname=plasma-applet-rss-feeds
pkgver=0.4.3
pkgrel=1
pkgdesc='A barebones Plasma applet for displaying an RSS feed'
arch=('any')
url='https://github.com/liujed/plasma-applet-rss-feeds'
license=('GPL-2.0-only')
depends=('plasma-workspace')
source=(
  "https://github.com/liujed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('51bde93c70b819d6f85eb715ce7ecabea6ac5657afd2088bc349e5961ecd53ab144edc13ab1413b35653a49ceb46d37530e05201b382f4f5fd77bcb01ad9bfa7')

package() {
  install -d "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
  cp -r \
    "${srcdir}/plasma-applet-rss-feeds-${pkgver}/package"/* \
    "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
}
