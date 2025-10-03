# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verus-analyzer-bin
pkgver=2025.10.03
_tag="${pkgver//./-}"
pkgrel=1
provides=('verus-analyzer')
conflicts=('verus-analyzer')
pkgdesc='A Verus compiler front-end for IDEs (derived from rust-analyzer)'
arch=('x86_64')
url='https://github.com/verus-lang/verus-analyzer'
license=('MIT OR Apache-2.0')
optdepends=('verus: verification support')
source=("$url/releases/download/$_tag/verus-analyzer-x86_64-unknown-linux-gnu.gz")
sha256sums=('e4446c4880616f7336ee9a3a70e2ebc4803fa23bb8e9ba178949b95d2715c1df')

package() {
    install -Dm755 verus-analyzer-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/verus-analyzer"
}
