# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verus-analyzer-bin
pkgver=2026.09.25
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
sha256sums=('23170a3dcd814e401715b5f2112ce1c24488ce93f38c17858bb457c87cb49054')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/verus-analyzer"
}
