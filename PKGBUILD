# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=phylonet
_installname=PhyloNet
pkgver=3.8.2
pkgrel=1
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
pkgdesc="TA suite of software tools for reconstructing/analyzing phylogenetic networks in the presence of reticulate evolutionary events"
arch=('x86_64')
url="https://bioinfocs.rice.edu/PhyloNet"
license=('GPL2')
source=("https://bioinfocs.rice.edu/sites/g/files/bxs266/f/kcfinder/files/PhyloNet_3.8.2.jar")
sha256sums=('0aa9c0e90c751ba14202e193f415d415fd9586a9a2b74c9fb22bbcaf306168d0')

package() {
    install -dm755 "$pkgdir"/usr/{bin,share/phylonet}
    install -Dm644 ${srcdir}/${_installname}_${pkgver}.jar ${pkgdir}/usr/share/phylonet/${_installname}.jar
    ln -s /usr/share/phylonet/${_installname}.jar ${pkgdir}/usr/bin/${_installname}.jar
}

