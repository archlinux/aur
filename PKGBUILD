# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=ttf-firge
pkgver=0.2.0
pkgrel=4
pkgdesc="Firge, a programming font that is a combination of Fira Mono and Genshin Gothic. "
arch=("any")
url="https://github.com/yuru7/Firge"
license=('custom:SIL')
source=("$url/releases/download/v$pkgver/Firge_v$pkgver.zip"
        "$url/releases/download/v$pkgver/FirgeNerd_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/Firge/v$pkgver/LICENSE.txt")

sha256sums=('18ccd0d5c7689a02af4a7217912c0112db9f24071e8b36a716baef3b446c32e7'
            'da3dd6437aeb3b68cf57c868602f1e7135b0eed7a91e4682f28a5efd7716afc9'
            '028720dcccc6b8077f18f9b379ced22d2a0a06220ad4844d6a08f5940f947fb5')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 Firge_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 FirgeNerd_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
