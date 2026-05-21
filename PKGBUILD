pkgname=2-micro-platformer-1982
pkgver=1.0.0
pkgrel=3
pkgdesc="Atari 2600 style 2-bit platformer game with procedural maze generation"
arch=('any')
license=('MIT')
depends=('python' 'python-pygame')
source=("retro_game.py"
        "2-micro-platformer-1982"
        "2-micro-platformer-1982.desktop")
sha256sums=('665431666911c5cd67b61b2ab50ff985436ccc57eb4401af9e4e2b1636534c67'
            'ea2e412d7f056e2ea2d54d07326dc71fb3613f76f8734dcea86887bd5d0beed5'
            '7b5b23769a4ebeebe52dfb65804cd84a0c2cf31055cbc8e626706f43dd0e7aaa')

package() {
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    install -m644 "${srcdir}/retro_game.py" "${pkgdir}/usr/share/${pkgname}/retro_game.py"
    install -m755 "${srcdir}/2-micro-platformer-1982" "${pkgdir}/usr/bin/2-micro-platformer-1982"
    install -m644 "${srcdir}/2-micro-platformer-1982.desktop" "${pkgdir}/usr/share/applications/2-micro-platformer-1982.desktop"
}
