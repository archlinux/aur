# Maintainer: Suprit S Jahagirdar <supritsj.d@gmail.com>
pkgname=fortitude-bin
pkgver=0.7.5
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
sha256sums_x86_64=('e88de102a93e1aa23db7187dd9cc164b55bbc19b1994a6b811c2a2e8057c2854')
sha256sums_aarch64=('f6a8d42612e1c240af3934888eac67ea90f450e8bc757756f58560202a7d622c')
sha256sums_i686=('cabec3a1076c89cb2778ec2573a4c5440608c3b6266f4bcdc2dd5c1bc29a38d2')

package(){
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/fortitude-$CARCH-unknown-linux-gnu/fortitude" "$pkgdir/usr/bin/fortitude"
}
