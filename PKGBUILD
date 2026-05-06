# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/sqeel
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=sqeel-bin
_pkgname=sqeel
pkgver=0.4.5
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
sha256sums_x86_64=('9677abdc05ce21b1490d746c0894d470bd05bc001c03d056ac8810469aaaa206')
sha256sums_aarch64=('1d329600a08717ec519ad7e5427491f343a0c09ef148c1f56639026e9b4a9200')

package() {
    install -Dm755 "$srcdir/sqeel" "$pkgdir/usr/bin/sqeel"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
