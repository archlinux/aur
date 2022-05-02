# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lfc-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="The Lingua Franca compiler"
arch=('x86_64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17')
source=("https://github.com/lf-lang/lingua-franca/releases/download/v${pkgver}/lfc_${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/lingua-franca/v${pkgver}/LICENSE")
sha512sums=('d28d7b901204d32f564399b1b633c73fc4816ee5eaea099bea643cb4662b5d9e319773f123a8fa04a48c8026d56b5a369e8659b693817bcdaa037d8b1b5e8751'
            '3b445e4c24bc0514043db597e02924c96917f55519db65f7a044e70c8905cb57387269437fb1648893ce68da6e2894eb3cc0a8c5de8944044c9513ae5fb89c8c')

package() {
  install -Dm644 "${srcdir}/lfc_${pkgver}/lib/jars/org.lflang.lfc-${pkgver}-SNAPSHOT-all.jar" "${pkgdir}/usr/share/java/lfc/org.lflang.lfc-${pkgver}-SNAPSHOT-all.jar"
}
