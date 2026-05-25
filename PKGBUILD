# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/hjkl
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=hjkl-bin
_pkgname=hjkl
pkgver=0.28.0
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
sha256sums_x86_64=('77af4bf49d53646ec1a2ede3279972f0165a2095f054e40cb42bc34d8f9a8452')
sha256sums_aarch64=('05e083a81b6ddc20062e98be5db88504b36761b47920012ddbd0d497c93a04b0')

package() {
    install -Dm755 "$srcdir/hjkl" "$pkgdir/usr/bin/hjkl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
