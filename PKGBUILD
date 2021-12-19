# Maintainer: NBonaparte <nbonaparte at protonmail dot com>

pkgname=otf-etbb
pkgver=1.054
pkgrel=1
pkgdesc="An expansion of Edward Tufte’s ET-Bembo family"
arch=('any')
url="https://www.ctan.org/pkg/etbb"
license=('MIT')
source=("http://mirrors.ctan.org/fonts/etbb.zip")
sha256sums=('a2c45a35ce97e7137cbd2bb1655fd25583012751509ddcc52d6a6af3d7b465d2')

package() {
    install -Dm644 "${srcdir}"/etbb/opentype/*.otf -t "${pkgdir}"/usr/share/fonts/OTF
}
