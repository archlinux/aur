# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=easycodeml
pkgver=1.21
pkgrel=1
pkgdesc="A visual tool for analysis of selection using CodeML"
arch=('x86_64')
url="https://github.com/BioEasy/EasyCodeML"
license=('unknow')
source=("https://github.com/starsareintherose/easycodeml/releases/download/${pkgver}/EasyCodeML.zip" "easycodeml.desktop" "EasyCodeML.png")
sha256sums=('45ef18a896818643908dc3ad637da7773f6d984e75f8a6faa61992a7d8e48776'
            'e20af3e0e14be4f95d634bf5c34cb35dc37edfada7d97f9c0e9dd10afa7cbf6f'
            '5393db9477bd071511788ea6255c49005274b4aebe792a7631eaa296ada14987')
depends=(
	'java-runtime'
)
package() {
    install -dm755 "$pkgdir"/usr/share/{EasyCodeML,applications}
    mv "$srcdir"/EasyCodeML/* "$pkgdir"/usr/share/EasyCodeML
    install -m 755 ${srcdir}/EasyCodeML.png ${pkgdir}/usr/share/EasyCodeML/EasyCodeML.png
    install -m 755 ${srcdir}/easycodeml.desktop ${pkgdir}/usr/share/applications/easycodeml.desktop 
}
