# Maintainer: Suprit S Jahagirdar <supritsj05@gmail.com>
pkgname=fortitude-bin
pkgver=0.7.1
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
sha256sums_x86_64=('7fd91a7097ec09d65a40f532952590976dceba44bbb2b25ca8d4b3d666a2e10c')
sha256sums_aarch64=('496b83e5154822269a99192c2039134ea72664422529eee7de8109f669c0f536')
sha256sums_i686=('e35f7e5e4394450c1f731d45a0fd10124a4a74da5db702b6c5f29790945b9cb0')

package(){
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/fortitude-$CARCH-unknown-linux-gnu/fortitude" "$pkgdir/usr/bin/fortitude"
}
