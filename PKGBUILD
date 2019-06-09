# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
pkgname=inkscape-paths2openscad
pkgver=0.25_2
pkgrel=1
pkgdesc='Inkscape extension for converting SVG paths to OpenSCAD'
arch=('any')
url='https://github.com/fablabnbg/inkscape-paths2openscad'
license=('GPL2')
depends=('inkscape' 'python')
optdepends=('cura: default slicer for STL post-processing'
            'openscad: to view .scad files')
source=("https://github.com/fablabnbg/inkscape-paths2openscad/releases/download/v${pkgver/_/-}/inkscape-paths2openscad_${pkgver/_/-}_all.deb")
sha256sums=('e5c395f40ddf0facebc3a43ea81e060c94b27468f1f85e78b50aaaa1c7594073')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/usr/share/doc/inkscape-paths2openscad/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
