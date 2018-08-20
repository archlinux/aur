# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=color-oracle
pkgver=1.3
pkgrel=1
pkgdesc='Design for the color impaired, a color blindness simulator'
arch=('any')
url='http://colororacle.org/index.html'
license=('MIT')
depends=("java-runtime" "bash")
source=("http://colororacle.org/ColorOracleJar.zip"
        "https://raw.githubusercontent.com/nvkelso/color-oracle-java/master/LICENSE.txt"
        "${pkgname}")
sha256sums=('7a11aa6146ae9a8044a111f2885a91b0e801e79f4496dd2d0a9a0cc70867de78'
            'd6154994f5921696e56843df591e50c4873c08877b80f62c8b8ab94b3948d193'
            '7b4227c3c71276ae29909fab3c8726fc951192f88c9a3e705283dbb73033d984')

package() {
  install -Dm644 "${srcdir}/ColorOracle.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/ColorOracle.jar"

  install -Dm644 "${srcdir}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  install -Dm755 "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
}
