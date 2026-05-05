# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/hodl
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=hodl-bin
_pkgname=hodl
pkgver=0.7.0
pkgrel=1
pkgdesc="Light crypto wallet for the terminal — multi-chain TUI built on ratatui. (binary release)"
arch=('x86_64' 'aarch64')
url="https://hodl.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source_x86_64=("hodl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hodl/releases/download/v${pkgver}/hodl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("hodl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hodl/releases/download/v${pkgver}/hodl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('271576b54134d3664b678390506f37831e66064c871000984d6aa14d44d53336')
sha256sums_aarch64=('bda743d4a1205355863d9bc6a1ac89cfd8b5c5f99d789dd1dbe085db93b8162e')

package() {
    install -Dm755 "$srcdir/hodl" "$pkgdir/usr/bin/hodl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
