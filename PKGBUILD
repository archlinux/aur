# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vpkg-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Alternative package manager for V'
url='https://github.com/vpkg-project/vpkg'
arch=(x86_64)
license=(MIT)
source=("$url/releases/download/$pkgver/vpkg-$pkgver-linux")
sha256sums=('1a9060d5bed0097894de65694a7213b832fca093e5db902dc7701dff6aaeb51b')
conflicts=(vpkg)
provides=(vpkg)

package() {
  install -Dm755 vpkg-$pkgver-linux "$pkgdir"/usr/bin/vpkg
}
