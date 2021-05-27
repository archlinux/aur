# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=pibuss
pkgver=1.4
_pkgver=1-4
pkgrel=1
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
pkgdesc="a BEAST/BEAGLE utility for sequence simulation, which provides an easy to use interface that allows flexible and extensible phylogenetic data fabrication"
arch=('x86_64')
url="https://rega.kuleuven.be/cev/ecv/software/pibuss"
license=('custom')
source=("https://rega.kuleuven.be/cev/ecv/software/pibuss_files/pibuss-v${_pkgver}.jar" "pibuss.desktop" "pibuss.png")
sha256sums=('a9d397ec6815339a2d4b268b99897a7d42250d4cd649b1ad2e458033e48b432c'
            '96cc7d7b0ffce5358b14c981ac84355237f5c9c5599ca9ead16f1d1f11d29f40'
            '18a508a9fc4fb169d366b7158095aa001f3ccc389f6aca8f2ae2df0b84413003')

package() {
    install -dm755 "$pkgdir"/usr/share/{applications,pibuss}
    install -m 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
    install -m 755 ${srcdir}/*.png ${pkgdir}/usr/share/pibuss
    install -m 755 ${srcdir}/pibuss-v${_pkgver}.jar ${pkgdir}/usr/share/pibuss/pibuss.jar
}
