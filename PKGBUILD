# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verus-analyzer-bin
pkgver=2025.11.18
_tag="${pkgver//./-}"
pkgrel=1
provides=('verus-analyzer')
conflicts=('verus-analyzer')
pkgdesc='A Verus compiler front-end for IDEs (derived from rust-analyzer)'
arch=('x86_64')
url='https://github.com/verus-lang/verus-analyzer'
license=('MIT OR Apache-2.0')
optdepends=('verus: verification support')
source=("$pkgname-$pkgver.gz::$url/releases/download/$_tag/verus-analyzer-x86_64-unknown-linux-gnu.gz")
sha256sums=('c25b66030a746863f76517c7e35321d6df4305f0e0512cb7140e55d0ef10f96b')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/verus-analyzer"
}
