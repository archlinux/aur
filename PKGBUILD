# Maintainer: Suprit S Jahagirdar <supritsj05@gmail.com>
pkgname=fortitude-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A Blazingly Fast Fortran linter, inspired by (and built upon) Ruff."
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/PlasmaFAIR/fortitude"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('fortitude')
conflicts=('fortitude')
options=('!debug')

source=("https://github.com/PlasmaFAIR/fortitude/blob/main/LICENSE")
source_x86_64=("https://github.com/PlasmaFAIR/fortitude/releases/download/v$pkgver/fortitude-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/PlasmaFAIR/fortitude/releases/download/v$pkgver/fortitude-aarch64-unknown-linux-gnu.tar.gz")
source_i686=("https://github.com/PlasmaFAIR/fortitude/releases/download/v$pkgver/fortitude-i686-unknown-linux-gnu.tar.gz")

sha256sums=('SKIP')
sha256sums_x86_64=('0ebb3ea570e64175ff2d2ca951c289e2de7eaddbd6c12160f2e74dd63732b8cd')
sha256sums_aarch64=('ebbaab155c5f3065432c3de342252742bf2afab91ab3cdaef887f4ed8ea6735a')
sha256sums_i686=('505a42d7df36c461ac25edb72fe8f69f19c3a5d5121f3db1c691fa3417e2a1f3')

package(){
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/fortitude-$CARCH-unknown-linux-gnu/fortitude" "$pkgdir/usr/bin/fortitude"
}
