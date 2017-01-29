# Maintainer: sL1pKn07 <sl1pkn07@gmail.com
# Contributor: Blackleg <blackleg@openaliasbox.org>

pkgname=ca-certificates-fnmt
pkgver=201611
pkgrel=2
pkgdesc="Spanish Fabrica Nacional de Moneda y Timbre (FNMT) certificates"
arch=('any')
url='https://www.sede.fnmt.gob.es'
license=('unknown')
depends=('ca-certificates-utils')
source=('https://www.sede.fnmt.gob.es/documents/10445900/10526749/FNMTClase2CA.cer')
sha256sums=('62b9267266212832a8e22dab933d91c7011274acf71703f9cc97833751a6e94f')
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

package() {
  install -Dm644 FNMTClase2CA.cer "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/FNMTClase2CA.cer"
}
