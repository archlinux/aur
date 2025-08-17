# Maintainer: Suprit S Jahagirdar <supritsj.d@gmail.com>
pkgname=fortitude-bin
pkgver=0.7.4
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
sha256sums_x86_64=('21c49cebdfbc442d4935253c56de4f9c71d0fc0806ce3837ba9adf6b8dbae8c0')
sha256sums_aarch64=('717a52963b4c32e8e7619fe9d272303b7c96a3c80727c802b99a57cf43af3d40')
sha256sums_i686=('9cfff1e25ac68afb99f7ad751d9fa0151b707184e609f629c21772517194fdee')

package(){
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/fortitude-$CARCH-unknown-linux-gnu/fortitude" "$pkgdir/usr/bin/fortitude"
}
