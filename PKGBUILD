# Maintainer: Kai Rollmann <naninonews@kairollmann.de>
pkgname=nanino-news-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Your local AI news dashboard: headlines from feeds you choose, in columns, with small AI classifiers that badge, hide or rank them"
arch=('x86_64')
url="https://kairollmann.de/naninonews"
license=('LicenseRef-Proprietary')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'hicolor-icon-theme')
provides=('nanino-news')
conflicts=('nanino-news')
options=('!strip')
source=("https://kairollmann.de/naninonews/releases/1.2.2/Nanino-News_1.2.2_amd64.tar.gz")
sha256sums=('36d592396900cdf9bf6a33817ed73b32f68f4e74c34e53fd77010051e9ff7f3a')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
