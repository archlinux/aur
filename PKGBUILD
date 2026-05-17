# Maintainer: Jed Liu <jed-aur.archlinux.org at litech dot org>

pkgname=plasma-applet-rss-feeds
pkgver=0.4.4
pkgrel=1
pkgdesc='A barebones Plasma applet for displaying an RSS feed'
arch=('any')
url='https://github.com/liujed/plasma-applet-rss-feeds'
license=('GPL-2.0-only')
depends=('plasma-workspace')
source=(
  "https://github.com/liujed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('e5c7b86e68c55dcc281acf0e9e16ea599f5ccd274f5c86025630c2df92b8c0c8c7386bafc3674ca5d1d8b3d24d04b245ce3a6fe4b613d315e382bf3fdbf31397')

package() {
  install -d "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
  cp -r \
    "${srcdir}/plasma-applet-rss-feeds-${pkgver}/package"/* \
    "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
}
