# Maintainer: AruFu <mraruuu at gmail.com>

pkgname=b2m
pkgver=0.23.0
pkgrel=1
pkgdesc="Play bilibili or other videos with mpv"
url="https://github.com/snylonue/b2m"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("https://github.com/snylonue/b2m/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3c0016a8da8ed8dd18910953fe2f4a317b5c02c2bfdf0b069d8a9d89e50e0583')

build() {
  return 0
}

package() {
  cd "$pkgname-$pkgver"
  cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
