# Maintainer: mxaddict <mxaddict at kryptic dot sh>
#
# Auto-generated. Source: https://github.com/kryptic-sh/krypt
# Edits made directly to the AUR repo will be overwritten on the next
# release. To change this PKGBUILD, edit `pkg/aur/PKGBUILD-bin.in` in
# the upstream repo and let `.github/workflows/release.yml` republish.
pkgname=krypt-bin
_pkgname=krypt
pkgver=0.2.1
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
sha256sums_x86_64=('1b0dd67fa95c29bea52b759ec166da0b32f0ea8a39315fa10b5edc2cd3414438')
sha256sums_aarch64=('57b00087c620bba2d9ba55b90835a69320073179b8049ac0051e17707e32775a')

package() {
    install -Dm755 "$srcdir/krypt" "$pkgdir/usr/bin/krypt"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
