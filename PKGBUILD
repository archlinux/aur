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
sha256sums=('d17919235f3228dd3b105486633468fac9e53bfbc339fd5f259912883fa9254b'
            'd2ba461225d363752656a5a2fefb50c169636d0f93eeaa1cbe56239e8867f647'
            '8aa79912d5b0bb791e93d3461445a04210b3009bd69c1b61632bca106827ce45')

package() {
    # Install the binary
    install -Dm755 "$srcdir/GDSongExtractor-linux" "$pkgdir/usr/bin/gdsongextractor"
    
    # Install desktop file
    install -Dm644 "$srcdir/gdsongextractor.desktop" "$pkgdir/usr/share/applications/gdsongextractor.desktop"
    
    # Install icon
    install -Dm644 "$srcdir/gdsongextractor.png" "$pkgdir/usr/share/pixmaps/gdsongextractor.png"
}
