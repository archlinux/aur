# Maintainer: mxaddict <mxaddict at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/krypt
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=krypt-bin
_pkgname=krypt
pkgver=0.0.1
pkgrel=1
pkgdesc="Cross-platform dotfiles manager. Rust binary. Config-driven. (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/kryptic-sh/krypt"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('glibc')

source_x86_64=("krypt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/krypt/releases/download/v${pkgver}/krypt-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("krypt-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/krypt/releases/download/v${pkgver}/krypt-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c43ccaab5b5c253b312c4bc5447ec8d9c5b2f2db83217e4848e2f8d140ec82d3')
sha256sums_aarch64=('b33c0218c1904f8f7357b310971d1ecd89277e54641852fe618533c64acc59c1')

package() {
    install -Dm755 "$srcdir/krypt" "$pkgdir/usr/bin/krypt"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
