# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/gpur
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=gpur-bin
_pkgname=gpur
pkgver=0.10.1
pkgrel=1
pkgdesc="btop-style GPU monitor TUI — NVIDIA, AMD, Intel, Apple Silicon (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/kryptic-sh/gpur"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source_x86_64=("gpur-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/gpur/releases/download/v${pkgver}/gpur-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("gpur-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/gpur/releases/download/v${pkgver}/gpur-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3361852d747381be91ebf21b60d81f6013d924fea49cf7dc81489e27be019522')
sha256sums_aarch64=('48e741767faab4e1f132626f3fa543558ed50b27da31688c2708b419e117da10')

package() {
    install -Dm755 "$srcdir/gpur" "$pkgdir/usr/bin/gpur"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
