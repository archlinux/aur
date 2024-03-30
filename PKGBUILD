# Maintainer: Jed Liu <jed-aur.archlinux.org at litech dot org>

pkgname=plasma-applet-rss-feeds
pkgver=0.4
pkgrel=1
pkgdesc='A barebones Plasma applet for displaying an RSS feed'
arch=('any')
url='https://github.com/liujed/plasma-applet-rss-feeds'
license=('GPL-2.0-only')
depends=('plasma-workspace')
source=(
  "https://github.com/liujed/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('49a4438bb445255fb683063094eef035bb91ecb660c422165db75b20484ac3d0472d6f7b55e50a5532b6ad12ced3396388730393c8cb3613a76f1e792999013a')

package() {
  install -d "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
  cp -r \
    "${srcdir}/plasma-applet-rss-feeds-${pkgver}/package"/* \
    "${pkgdir}/usr/share/plasma/plasmoids/com.github.liujed.rssfeeds"
}
