# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgname='spotify-tui-bin'
pkgver=0.16.0
pkgrel=1
pkgdesc="Spotify client for the terminal written in Rust"
arch=('x86_64')
url='https://github.com/Rigellute/spotify-tui'
license=('MIT')
depends=(openssl libxcb)
provides=('spotify-tui')

source=("$url/releases/download/v$pkgver/spotify-tui-linux.tar.gz"
        "https://raw.githubusercontent.com/Rigellute/spotify-tui/v$pkgver/LICENSE")
sha256sums=('9c368a1a48d52c7241102e7c6774e811b96dac70411db73bc301da57c9de6d5a'
            '76b2d30f74716c0cbd02e37868961dce2b52f65af6355864d010ee7e695d2b88')

function package {
    install -Dt "$pkgdir/usr/bin/" "$srcdir/spt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
