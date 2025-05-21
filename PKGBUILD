# Maintainer: Suprit S Jahagirdar <supritsj05@gmail.com>
pkgname=fortitude-bin
pkgver=0.7.3
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
sha256sums_x86_64=('2ff47cfc0dfb35ec5fff56d79a48dd946fbb9cb60dbf8ffcd2cb9221271799e1')
sha256sums_aarch64=('7ca0b0998aaa3f494495ce18dd9e0d66aa0cc30cdf5fdb0983f6dcd51cbd53dc')
sha256sums_i686=('5572e7f34379fae41535e728534d294c80820a37e2c9dc4f368d95f0c5f6edc8')

package(){
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/fortitude-$CARCH-unknown-linux-gnu/fortitude" "$pkgdir/usr/bin/fortitude"
}
