# Maintainer: mxaddict <mxaddict at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/krypt
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=krypt-bin
_pkgname=krypt
pkgver=0.7.0
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
sha256sums_x86_64=('c321adfe6039733c7cd01b919d6cf45115cd57f4c9878b697a5a6c68d44b82cf')
sha256sums_aarch64=('ff4ac420bf3f776cdc4598b7db594812802ac6998fa7a4af850619c5940cb0b0')

package() {
    install -Dm755 "$srcdir/krypt" "$pkgdir/usr/bin/krypt"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
