# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/hjkl
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=hjkl-bin
_pkgname=hjkl
pkgver=0.8.1
pkgrel=1
pkgdesc="Vim-modal terminal editor: standalone TUI built on the hjkl engine. (binary release)"
arch=('x86_64' 'aarch64')
url="https://hjkl.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('libxcb')

source_x86_64=("hjkl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hjkl/releases/download/v${pkgver}/hjkl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("hjkl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/hjkl/releases/download/v${pkgver}/hjkl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1e1446747b5f1a4315baf1bc19f34634da1359b5033c082cc0f2851ef931bc9d')
sha256sums_aarch64=('4d6a67ac3e105debde40464d4ebe89b1c09ea856c167e521dd7ffed4aa202089')

package() {
    install -Dm755 "$srcdir/hjkl" "$pkgdir/usr/bin/hjkl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
