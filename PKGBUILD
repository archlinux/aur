# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/sqeel
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=sqeel-bin
_pkgname=sqeel
pkgver=0.4.0
pkgrel=1
pkgdesc="Vim-modal SQL client: TUI front-end for sqlx-backed connections with LSP-aware editing. (binary release)"
arch=('x86_64' 'aarch64')
url="https://sqeel.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('libxcb' 'gcc-libs')

source_x86_64=("sqeel-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/sqeel/releases/download/v${pkgver}/sqeel-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("sqeel-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/sqeel/releases/download/v${pkgver}/sqeel-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('0dbac28a1aef6d7678da1333836037f2e08cb42dff9a5709fd946e9ed37fcc1e')
sha256sums_aarch64=('8cdd36da593d11289c5418311bfe4c3bbc9784a52f5f9a32ebe6b68102aa4786')

package() {
    install -Dm755 "$srcdir/sqeel" "$pkgdir/usr/bin/sqeel"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
