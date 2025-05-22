# Maintainer: Misano <me@mirsobhan.ir>

pkgname=anarch-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Arch Linux config manager (binary only)"
arch=('x86_64' 'aarch64')
url="https://github.com/mirs0bhan/Anarch"
license=('custom')
depends=()
provides=('anarch')
conflicts=('anarch')
source_x86_64=("https://github.com/mirs0bhan/Anarch/releases/download/v$pkgver/anarch-x86_64")
source_aarch64=("https://github.com/mirs0bhan/Anarch/releases/download/v$pkgver/anarch-aarch64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "$srcdir/anarch-${CARCH}" "$pkgdir/usr/local/bin/anarch"
}
