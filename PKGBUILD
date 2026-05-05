# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/hodl
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=hodl-bin
_pkgname=hodl
pkgver=0.4.0
pkgrel=1
pkgdesc="Light crypto wallet for the terminal — multi-chain TUI built on ratatui. (binary release)"
arch=('x86_64' 'aarch64')
url="https://hodl.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source_x86_64=("hodl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hodl/releases/download/v${pkgver}/hodl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("hodl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hodl/releases/download/v${pkgver}/hodl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('77d01200e4bb2bd8639b8717a7de046790ac4a97e1dcb3316ba0379d83f32eed')
sha256sums_aarch64=('a9789c43bf2a268734d7c19f5aaa4982a1ddc5b7db7ec79da6531256aa392077')

package() {
    install -Dm755 "$srcdir/hodl" "$pkgdir/usr/bin/hodl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
