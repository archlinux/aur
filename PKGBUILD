# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=easycodeml
pkgver=1.4
pkgrel=1
pkgdesc="A visual tool for analysis of selection using CodeML. https://doi.org/10.1002/ece3.5015"
arch=('x86_64')
url="https://github.com/BioEasy/EasyCodeML"
license=('LGPL3')
source=("https://raw.githubusercontent.com/BioEasy/EasyCodeML/master/EasyCodeML.jar" "easycodeml.desktop" "EasyCodeML.png")
sha256sums=('16eef77a21be47ac2b2cf2e04ded75dc76546a71e0ca227aa21e0418ec8caf36'
            'e20af3e0e14be4f95d634bf5c34cb35dc37edfada7d97f9c0e9dd10afa7cbf6f'
            '5393db9477bd071511788ea6255c49005274b4aebe792a7631eaa296ada14987')
depends=(
	'java-runtime'
)
package() {
    install -dm755 "$pkgdir"/usr/share/{EasyCodeML,applications}
    install -Dm 755 "$srcdir"/EasyCodeML.jar "$pkgdir"/usr/share/EasyCodeML
    install -m 755 ${srcdir}/EasyCodeML.png ${pkgdir}/usr/share/EasyCodeML/EasyCodeML.png
    install -m 755 ${srcdir}/easycodeml.desktop ${pkgdir}/usr/share/applications/easycodeml.desktop 
}
