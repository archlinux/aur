# Maintainer: mxaddict <mxaddict at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/krypt
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=krypt-bin
_pkgname=krypt
pkgver=0.3.0
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
sha256sums_x86_64=('a27e46e63fd85b7a69c94723848c27f5865ea9f863511094baa171a29034c4fa')
sha256sums_aarch64=('27046b327190eb7741c5b83d1673c87caeb204e9e8f634913847b62e764f1b8c')

package() {
    install -Dm755 "$srcdir/krypt" "$pkgdir/usr/bin/krypt"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
