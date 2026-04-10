# Maintainer: VoidWalker-00 <https://github.com/VoidWalker-00>
pkgname=scrape-tool-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Custom scrape tool for mass scraping of any website"
arch=('x86_64')
url="https://github.com/VoidWalker-00/Scrape_Tool"
license=('custom:unlicensed')
depends=('nodejs' 'chromium' 'webkit2gtk-4.1')
provides=('scrape-tool')
conflicts=('scrape-tool')
source=("${pkgname}-${pkgver}.deb::https://github.com/VoidWalker-00/Scrape_Tool/releases/download/v${pkgver}/Scrape.Tool_${pkgver}_amd64.deb")
sha256sums=('fbf233163a02b6d630211f3fa2e4893c27b0045f42f7c8e68de5467b20740827')

package() {
    cd "$srcdir"
    ar x "${pkgname}-${pkgver}.deb"
    tar xf data.tar.*  -C "${pkgdir}/"
}
