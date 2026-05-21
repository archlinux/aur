pkgname=2-micro-platformer-1982
pkgver=1.0.0
pkgrel=1
pkgdesc="Atari 2600 style 2-bit platformer game with procedural maze generation"
arch=('any')
license=('MIT')
depends=('python' 'python-pygame')
source=("retro_game.py"
        "2-micro-platformer-1982"
        "2-micro-platformer-1982.desktop")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    install -m644 "${srcdir}/retro_game.py" "${pkgdir}/usr/share/${pkgname}/retro_game.py"
    install -m755 "${srcdir}/2-micro-platformer-1982" "${pkgdir}/usr/bin/2-micro-platformer-1982"
    install -m644 "${srcdir}/2-micro-platformer-1982.desktop" "${pkgdir}/usr/share/applications/2-micro-platformer-1982.desktop"
}
