# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/lyr
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=lyr-bin
_pkgname=lyr
pkgver=0.3.0
pkgrel=1
pkgdesc="A desktop status bar for Wayland, Windows and macOS (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/kryptic-sh/lyr"
license=('MIT')
# Linked: glibc and libgcc. Opened at run time (crcbl's dlopen): the
# Wayland client library, the Vulkan loader, xkbcommon and fontconfig.
depends=('glibc' 'gcc-libs' 'wayland' 'vulkan-icd-loader' 'libxkbcommon' 'fontconfig')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source_x86_64=("lyr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/lyr/releases/download/v${pkgver}/lyr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("lyr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/kryptic-sh/lyr/releases/download/v${pkgver}/lyr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('de690d16f7428ec15f6bd8834a201a41b8c318c9a0cf6d2c1c8ce35f9a71c044')
sha256sums_aarch64=('282d408dae294fe20c9af0238cf63bfe6d367e1bed6eaf18440c805f849929cc')

package() {
    install -Dm755 "$srcdir/lyr" "$pkgdir/usr/bin/lyr"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
