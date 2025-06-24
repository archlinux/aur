# Maintainer: MalikHw47 <help.malicorporation@gmail.com>
pkgname=gdsongextractor-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="A cool-ahh tool for exporting and managing Geometry Dash custom songs with metadata"
arch=('x86_64')
url="https://github.com/MalikHw/GDSongExtractor"
license=('MIT')
depends=()
provides=('gdsongextractor')
conflicts=('gdsongextractor')
source=("GDSongExtractor-linux::https://github.com/MalikHw/GDSongExtractor/releases/download/v1.0.2/GDSongExtractor-linux"
        "gdsongextractor.desktop::https://github.com/MalikHw/GDSongExtractor/releases/download/v1.0.2/gdsongextractor.desktop"
        "gdsongextractor.png::https://github.com/MalikHw/GDSongExtractor/releases/download/v1.0.2/icon.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/gdsongextractor"
    
    # Install desktop file
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.desktop" "${pkgdir}/usr/share/applications/gdsongextractor.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/gdsongextractor.png"
}
