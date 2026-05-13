# Maintainer: kryptic.sh <hello at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/hjkl
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=hjkl-bin
_pkgname=hjkl
pkgver=0.14.11
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
sha256sums_x86_64=('c9db2091c980c1c0e37390530c85b73000b7eb7e671c525d957066bda384027b')
sha256sums_aarch64=('12b612092b8c41b882d5c90dac6fa1d1090177008bedd82a59d091f3d7495acf')

package() {
    install -Dm755 "$srcdir/hjkl" "$pkgdir/usr/bin/hjkl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
