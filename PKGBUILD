# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=polybar-fcitx-scripts
pkgver=0.0.1
pkgrel=1
pkgdesc="Shell scripts to show current Fcitx IM in Polybar"
arch=(any)
license=('GPL')
depends=(glib2)
source=(config current imlist react watch polybar-fcitx-watch)
sha256sums=(
    845f3abdf24213486aca68af490bb3e3004e21b504879454f795fc1e1b2ef107
    422f047a08b437b0ea2a0305ea2e48d2744cb536998c77b02646c6fffac6b04e
    0b504585ee8f717b1824e05a509d57191a562420d83370c14da5c51bde65e041
    52a2b8379b10577766a338d9ab03ffbc771a256f7c47436598f692afe5269c1d
    02be62df8cebf5eba5982d8245e7dc12b72dafd4c8dfb5a60af9413d1d077949
    04c3814f8c0da6885e4bd41e8b460da06006fc6434a76891d4a7dbcc6550b2bc
)

package() {
    install -Dm755 polybar-fcitx-watch -t "${pkgdir}/usr/bin"
    install -Dm755 watch react imlist current -t "${pkgdir}/opt/${pkgname}"
    install -Dm644 config "${pkgdir}/usr/share/doc/${pkgname}/config"
}
