# Maintainer: byteowlz
pkgname=tmz
pkgver=0.2.6
pkgrel=1
pkgdesc="Microsoft Teams from the terminal"
arch=('x86_64')
url="https://github.com/byteowlz/tmz"
license=('MIT')
depends=('gcc-libs' 'nodejs')
optdepends=('npm: for installing playwright for browser-based auth')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/tmz/releases/download/v$pkgver/tmz-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('cd63a2d1f2111e0a5cc6df9b01bfbdba8fff65475573d3117d69e68b694da190')

package() {
    cd "$pkgname-v$pkgver-x86_64-unknown-linux-gnu"
    install -Dm755 tmz "$pkgdir/usr/bin/tmz"
    install -Dm644 teams-auth.mjs "$pkgdir/usr/share/tmz/teams-auth.mjs"
}
