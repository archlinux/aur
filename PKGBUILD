# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgname='spotify-tui-bin'
pkgver=0.17.0
pkgrel=1
pkgdesc="Spotify client for the terminal written in Rust"
arch=('x86_64')
url='https://github.com/Rigellute/spotify-tui'
license=('MIT')
depends=(openssl libxcb)
provides=('spotify-tui')

source=("$url/releases/download/v$pkgver/spotify-tui-linux.tar.gz"
        "https://raw.githubusercontent.com/Rigellute/spotify-tui/v$pkgver/LICENSE")
sha256sums=('7d9bc078ffcd7dac8ac69df723affb3a38255a295df5ce9276274d5e628ea899'
            '76b2d30f74716c0cbd02e37868961dce2b52f65af6355864d010ee7e695d2b88')

function package {
    install -Dt "$pkgdir/usr/bin/" "$srcdir/spt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
