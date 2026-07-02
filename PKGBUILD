# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/gpur
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=gpur-bin
_pkgname=gpur
pkgver=0.6.0
pkgrel=1
pkgdesc="btop-style GPU monitor TUI — NVIDIA, AMD, Apple Silicon (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/kryptic-sh/gpur"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source_x86_64=("gpur-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/gpur/releases/download/v${pkgver}/gpur-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("gpur-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/gpur/releases/download/v${pkgver}/gpur-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('31896e7042bb38d8271f5d3d231f300ecffaa0a23a2ed50409162b5e50f211f2')
sha256sums_aarch64=('99b6b4f85b1ccdd775a3038cc6e20b01c9736c5701a19d1baf5647ca6644d320')

package() {
    install -Dm755 "$srcdir/gpur" "$pkgdir/usr/bin/gpur"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
