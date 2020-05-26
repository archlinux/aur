# Maintainer: Steven Huang <s@stvhuang.me>

pkgname=ttf-cmu-concrete
pkgver=1.0
pkgrel=1
pkgdesc="CMU Concrete"
arch=('any')
url="https://fontlibrary.org/en/font/cmu-concrete"
license=('OFL')
depends=()
source=('https://fontlibrary.org/assets/downloads/cmu-concrete/4dc4d9812272fbd7cb913c389a001c50/cmu-concrete.zip')
sha256sums=('b090d97ad5c76375fcdc22b0f42004570729b356105f4d08e86d1920e63e662b')

package() {
    install -t "${pkgdir}/usr/share/fonts/TTF/" -vDm644 Concrete/*.ttf
    install -vDm644 Concrete/OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
