pkgname=2-micro-platformer-1982
pkgver=1.0.0
pkgrel=2
pkgdesc="Atari 2600 style 2-bit platformer game with procedural maze generation"
arch=('any')
license=('MIT')
depends=('python' 'python-pygame')
source=("retro_game.py"
        "2-micro-platformer-1982"
        "2-micro-platformer-1982.desktop")
sha256sums=('e66f2449813d4ab596d1aad8614bceac736caa30790540110cf090981877411d'
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
