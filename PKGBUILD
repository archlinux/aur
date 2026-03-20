# Maintainer: Crstian <me@crstian.me>
pkgname=aceplay-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Modern CLI to play Ace Stream links - auto-starts acestream-engine (pre-built binary)"
arch=('x86_64')
url="https://github.com/crstian19/aceplay"
license=('MIT')
depends=('acestream-engine')
optdepends=(
    'mpv: recommended video player'
    'vlc: alternative video player'
    'ffplay: alternative video player'
)
source=("https://github.com/crstian19/aceplay/releases/download/v${pkgver}/aceplay_${pkgver}_linux_amd64.tar.gz"
        "aceplay.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/aceplay" "$pkgdir/usr/bin/aceplay"
    install -Dm644 "$srcdir/aceplay.desktop" "$pkgdir/usr/share/applications/aceplay.desktop"
}
