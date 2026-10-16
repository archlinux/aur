# Maintainer: Kai Rollmann <naninonews@kairollmann.de>
pkgname=nanino-news-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Your local AI news dashboard: headlines from feeds you choose, in columns, with small AI classifiers that badge, hide or rank them"
arch=('x86_64')
url="https://kairollmann.de/naninonews"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'hicolor-icon-theme')
provides=('nanino-news')
conflicts=('nanino-news')
options=('!strip')
source=("https://kairollmann.de/naninonews/releases/1.2.0/Nanino-News_1.2.0_amd64.tar.gz")
sha256sums=('ef98e6937d54e1eb05da974bb3344d7494487380948a0377a0043fe600bfa6d5')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
