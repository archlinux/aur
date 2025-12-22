# Maintainer: Kljunas2 <miha at korenjak dot si>

pkgname=otf-sinistre
pkgver=69.420
pkgrel=1
pkgdesc="A font inspired by Gaelic and Uncial minuscule"
arch=("any")
url="https://www.collletttivo.it/typefaces/sinistre"
license=('OFL-1.1')
source=("https://codeload.github.com/collletttivo/sinistre/zip/refs/heads/main")
sha256sums=('01c6daaaa07d7a61202608306ef15c1283a46a0c209e2dddf14ac1850bf86e94')

package() {
  cd "${srcdir}/sinistre-main"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
  mkdir -p  "${pkgdir}/usr/share/fonts/OTF"
  install -m644 fonts/*.otf "${pkgdir}/usr/share/fonts/OTF/"
}
