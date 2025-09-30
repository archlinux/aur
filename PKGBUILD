# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verus-analyzer-bin
_tag=2025-09-29
pkgver="${_tag//-/.}"
pkgrel=1
provides=('verus-analyzer')
conflicts=('verus-analyzer')
pkgdesc='A Verus compiler front-end for IDEs (derived from rust-analyzer)'
arch=('x86_64')
url='https://github.com/verus-lang/verus-analyzer'
license=('MIT OR Apache-2.0')
optdepends=('verus: verification support')
source=("$url/releases/download/$_tag/verus-analyzer-x86_64-unknown-linux-gnu.gz")
sha256sums=('f53957b7e447ea792ad71e0c3e8288a8a0598621aa2f531eeb14898415decda9')

package() {
    install -Dm755 verus-analyzer-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/verus-analyzer"
}
