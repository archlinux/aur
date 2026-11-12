# Maintainer: Kai Rollmann <naninonews@kairollmann.de>
pkgname=nanino-news-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Your local AI news dashboard: headlines from feeds you choose, in columns, with small AI classifiers that badge, hide or rank them"
arch=('x86_64')
url="https://kairollmann.de/naninonews"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'hicolor-icon-theme')
provides=('nanino-news')
conflicts=('nanino-news')
options=('!strip')
source=("https://kairollmann.de/naninonews/releases/1.2.1/Nanino-News_1.2.1_amd64.tar.gz")
sha256sums=('2fff9c21a5df933e4a9fce139695060d3a99ad0c0e5655b7b85da96a67a64d59')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
