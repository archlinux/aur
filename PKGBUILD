# Maintainer: Jed Liu <jed-aur.archlinux.org at litech dot org>

pkgname=plasma-applet-rss-feeds
pkgver=0.4.2
pkgrel=1
pkgdesc='A barebones Plasma applet for displaying an RSS feed'
arch=('any')
url='https://github.com/liujed/plasma-applet-rss-feeds'
license=('GPL-2.0-only')
depends=('plasma-workspace')
source=(
  "https://github.com/liujed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('b445eed94314eb424ded4e1922628f5324b698e8e79797a71429d60e947ba17b2b256ec96adcf89823ac6587a0b2b045aadd64140ed67f936464ee7878d5a2da')

package() {
  install -d "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
  cp -r \
    "${srcdir}/plasma-applet-rss-feeds-${pkgver}/package"/* \
    "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
}
