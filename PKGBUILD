# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/lyr
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/ci.yml` republish.
pkgname=lyr-bin
_pkgname=lyr
pkgver=0.1.0
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
sha256sums_x86_64=('36b0ebf5dd59eed5adac798a9d78228976219d40108c7fad73e22200af59b529')
sha256sums_aarch64=('7cb385a138eb11177bf35a3c43f08e051e89e88fc055cb755e0af892eccd391e')

package() {
    install -Dm755 "$srcdir/lyr" "$pkgdir/usr/bin/lyr"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
