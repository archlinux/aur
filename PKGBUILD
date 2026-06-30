# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=agntz
pkgver=0.3.1
pkgrel=1
pkgdesc="Agent utility toolkit for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/agntz"
license=('MIT')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/agntz/releases/download/v$pkgver/agntz-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/agntz/releases/download/v$pkgver/agntz-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3bd657e50a1799f8b31362c03ff2f8a11cb018bc61775abc5fb950cea0e3bf1b')
sha256sums_aarch64=('d0cb5587eb3bf38502c257b42bb7dd58efb930d1edad640317e4c556ddf43208')

package() {
    install -Dm755 agntz "$pkgdir/usr/bin/agntz"
}
