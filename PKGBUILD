# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/pikr
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=pikr-bin
_pkgname=pikr
pkgver=0.4.1
pkgrel=1
pkgdesc="Vim-modal application launcher — rofi replacement built on floem. (binary release)"
arch=('x86_64' 'aarch64')
url="https://pikr.kryptic.sh/"
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source_x86_64=("pikr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/pikr/releases/download/v${pkgver}/pikr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("pikr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/pikr/releases/download/v${pkgver}/pikr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fe71f69cc96c3ab2527fbf99f6da5d49260a10c3101b5c403724f46b9fe11a4d')
sha256sums_aarch64=('885e804a9ed7723755b40c49fc84e9f91cdf78c6c1238c86aedbefae38d79f86')

package() {
    install -Dm755 "$srcdir/pikr" "$pkgdir/usr/bin/pikr"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
