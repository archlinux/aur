# Maintainer: Kai Rollmann <naninonews@kairollmann.de>
pkgname=nanino-news-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Your local AI news dashboard: headlines from feeds you choose, in columns, with small AI classifiers that badge, hide or rank them"
arch=('x86_64')
url="https://kairollmann.de/naninonews"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'hicolor-icon-theme')
provides=('nanino-news')
conflicts=('nanino-news')
options=('!strip')
source=("https://kairollmann.de/naninonews/releases/1.1.1/Nanino-News_1.1.1_amd64.tar.gz")
sha256sums=('fb5aac87754f1c7d35d680a6fe664661124c4f0dbd60700c83060e3d1416aa1e')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
