# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=crocotile3d
pkgver=2.2.6
pkgrel=1
pkgdesc='Tile-based 3D modeling application'
arch=('x86_64')
license=('Unknown')
options=(!strip)
source=("https://jdigi.net/AUR/Crocotile3D/Crocotile3D_v${pkgver}_linux64.tar.gz")
sha256sums=('d3c7fedb7b803902e85b06cf2b91851e9e6170a6eb6f4a3265c4d59355c613fc')

install_location='/usr/share'

package() {
    install -d "${pkgdir}${install_location}/${pkgname}"
    cp -ar Crocotile3D_v${pkgver}_linux64/* "${pkgdir}${install_location}/${pkgname}/"
    chmod -R 755 "${pkgdir}${install_location}/${pkgname}"
    
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${install_location}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
