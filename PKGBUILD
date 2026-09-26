# Maintainer: Kai Rollmann <naninonews@kairollmann.de>
pkgname=nanino-news-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Your local AI news dashboard: headlines from feeds you choose, in columns, with small AI classifiers that badge, hide or rank them"
arch=('x86_64')
url="https://kairollmann.de/naninonews"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'hicolor-icon-theme')
provides=('nanino-news')
conflicts=('nanino-news')
options=('!strip')
source=("https://kairollmann.de/naninonews/releases/1.1.2/Nanino-News_1.1.2_amd64.tar.gz")
sha256sums=('b87ff7ed753186ca6e710da1095e489663ccd2be54386ae4b951faf7cbe10fe5')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
