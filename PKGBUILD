# Maintainer: Jed Liu <jed-aur.archlinux.org at litech dot org>

pkgname=plasma-applet-rss-feeds
pkgver=0.4.1
pkgrel=1
pkgdesc='A barebones Plasma applet for displaying an RSS feed'
arch=('any')
url='https://github.com/liujed/plasma-applet-rss-feeds'
license=('GPL-2.0-only')
depends=('plasma-workspace')
source=(
  "https://github.com/liujed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('64c0e440297c4cc64c5d81ef4cacd366865c4e4fad1bba1bef69cf05b20dc236e5829054bae6e2d2bc55c59906baf9e68eb7a2004a317dc95309d763729ffb6d')

package() {
  install -d "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
  cp -r \
    "${srcdir}/plasma-applet-rss-feeds-${pkgver}/package"/* \
    "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
}
