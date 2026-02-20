# Maintainer: Crstian <me@crstian.me>

pkgname=aceplay
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern CLI to play Ace Stream links - auto-starts acestream-engine, supports mpv/vlc"
arch=('x86_64' 'aarch64')
url="https://github.com/crstian19/aceplay"
license=('MIT')
depends=('acestream-engine')
optdepends=(
    'mpv: recommended video player'
    'vlc: alternative video player'
    'ffplay: alternative video player'
)
makedepends=('go')
conflicts=('acestream-launcher')
replaces=('acestream-launcher')
source=("https://github.com/crstian19/aceplay/releases/download/v${pkgver}/aceplay-linux-${CARCH}"
        "aceplay.desktop")
sha256sums=('SKIP'
            'SKIP')

build() {
    return 0
}

check() {
    return 0
}

package() {
    install -Dm755 "$srcdir/aceplay" "$pkgdir/usr/bin/aceplay"
    install -Dm644 "$srcdir/aceplay.desktop" "$pkgdir/usr/share/applications/aceplay.desktop"
}
