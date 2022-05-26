# Maintainer: NBonaparte <nbonaparte at protonmail dot com>

pkgname=otf-etbb
pkgver=1.056
pkgrel=1
pkgdesc="An expansion of Edward Tufte’s ET-Bembo family"
arch=('any')
url="https://www.ctan.org/pkg/etbb"
license=('MIT')
source=("http://mirrors.ctan.org/fonts/etbb.zip")
sha256sums=('5e380baf3be1fd975fe36c543d26ac701d55f19647126e8680368f1b54d79de0')

package() {
    install -Dm644 "${srcdir}"/etbb/opentype/*.otf -t "${pkgdir}"/usr/share/fonts/OTF
}
