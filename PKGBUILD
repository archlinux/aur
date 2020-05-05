# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='spotify-tui-bin'
pkgver=0.19.0
pkgrel=2
pkgdesc="Spotify client for the terminal written in Rust"
arch=('x86_64')
url='https://github.com/Rigellute/spotify-tui'
license=('MIT')
depends=(openssl libxcb)
provides=('spotify-tui')
conflicts=('spotify-tui')

source=("$url/releases/download/v$pkgver/spotify-tui-linux.tar.gz"
        "https://raw.githubusercontent.com/Rigellute/spotify-tui/v$pkgver/LICENSE")
sha256sums=('b5a40090ec1a3b3013214e9ac389775f0a07ae8c90cbac6a9b2869f99ad873c3'
            '76b2d30f74716c0cbd02e37868961dce2b52f65af6355864d010ee7e695d2b88')

function package {
    install -Dt "$pkgdir/usr/bin/" "$srcdir/spt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
