# Maintainer: NBonaparte <nbonaparte at protonmail dot com>

pkgname=otf-etbb
pkgver=1.053
pkgrel=1
pkgdesc="An expansion of Edward Tufte’s ET-Bembo family"
arch=('any')
url="https://www.ctan.org/pkg/etbb"
license=('MIT')
source=("http://mirrors.ctan.org/fonts/etbb.zip")
sha256sums=('27c96f902f1abd7a5de56c72a86b384526be4b9c70fdfdac5852a7bdfd001d4d')

package() {
    install -Dm644 "${srcdir}"/etbb/opentype/*.otf -t "${pkgdir}"/usr/share/fonts/OTF
}
