# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=ttf-firge
pkgver=0.3.0
pkgrel=5
pkgdesc="Firge, a programming font that is a combination of Fira Mono and Genshin Gothic. "
arch=("any")
url="https://github.com/yuru7/Firge"
license=('custom:SIL')
source=("$url/releases/download/v$pkgver/Firge_v$pkgver.zip"
        "$url/releases/download/v$pkgver/FirgeNerd_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/Firge/v$pkgver/LICENSE")

sha256sums=('c986f621000a6598064c7e2078322ed02040af4f7804d258033df949b35b0527'
            '54cd76378fbc5025f42d441d95ca6ec1d3ecc4270e6107558840fed7c04cfe4f'
            'b72891ba4f9947243d786d5d88b655fc48434d35f669bab1fa4d34b575c07601')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 Firge_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 FirgeNerd_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
