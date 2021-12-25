# Maintainer: NBonaparte <nbonaparte at protonmail dot com>

pkgname=otf-etbb
pkgver=1.055
pkgrel=1
pkgdesc="An expansion of Edward Tufte’s ET-Bembo family"
arch=('any')
url="https://www.ctan.org/pkg/etbb"
license=('MIT')
source=("http://mirrors.ctan.org/fonts/etbb.zip")
sha256sums=('bd75cd0db6bceb6d7e7284f12bfa66e017cbe37cd2d2b46a866e5eea80776897')

package() {
    install -Dm644 "${srcdir}"/etbb/opentype/*.otf -t "${pkgdir}"/usr/share/fonts/OTF
}
