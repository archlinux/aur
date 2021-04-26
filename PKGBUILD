# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='spotify-tui-bin'
pkgver=0.24.0
pkgrel=1
pkgdesc="Spotify client for the terminal written in Rust"
arch=('x86_64')
url='https://github.com/Rigellute/spotify-tui'
license=('MIT')
depends=(openssl libxcb)
provides=('spotify-tui')
conflicts=('spotify-tui')

source=("spotify-tui-linux-$pkgver.tar.gz::$url/releases/download/v$pkgver/spotify-tui-linux.tar.gz"
        "https://raw.githubusercontent.com/Rigellute/spotify-tui/v$pkgver/LICENSE")
sha256sums=('70a1692e897649ebafde64c7be23060aa533198ca16bfa1cb4478bce92e74fc9'
            '76b2d30f74716c0cbd02e37868961dce2b52f65af6355864d010ee7e695d2b88')

function package {
    install -Dt "$pkgdir/usr/bin/" "$srcdir/spt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
