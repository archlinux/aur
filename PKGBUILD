# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>

pkgname=color-oracle
pkgver=1.2
pkgrel=2
pkgdesc='Design for the color impaired, a color blindness simulator'
arch=('any')
url='http://colororacle.org/index.html'
license=('MIT')
depends=("java-runtime" "bash")
source=("http://colororacle.org/ColorOracleJar.zip"
        "https://raw.githubusercontent.com/nvkelso/color-oracle-java/master/LICENSE.txt"
        "${pkgname}")
sha256sums=('174a211edd1350ed41bb1c033d7999083295f6979d4c63c1f57041bdd8c843a4'
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
