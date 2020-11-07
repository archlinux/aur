# Maintainer: Pavel Finkelshteyn <pavel.finkelshtein+AUR@gmail.com>

pkgname=ets-bin
pkgdesc=' Command output timestamper '
pkgver=0.2.1
pkgrel=1
url='https://github.com/zmwangx/ets'
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')
makedepends=()
depends=()
_source_prefix="https://github.com/zmwangx/ets/releases/download/v$pkgver/ets_"
source=("LICENSE::https://raw.githubusercontent.com/zmwangx/ets/master/COPYING")
source_x86_64=("${_source_prefix}${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_source_prefix}${pkgver}_linux_arm64.tar.gz")
source_i686=("${_source_prefix}${pkgver}_linux_i386.tar.gz")
b2sums=("c74bd47ae7436c2d571168ecb62578fbde988deb0b94a8b4004d66b3c824ab2f45289a0dad06e6744265a5c7fb69c07306499d8b8a2dac266f7f8ae4ca36fb19")
b2sums_x86_64=("22aab8b7aadd004b6411495f92e7e8dd5c1caa1a44e6d0c2f1ab2d29a58165bbb2cda68e331568b33c609e7540c5500912da71babafc05d8947a8c53a850776b")
b2sums_aarch64=("307915ec57e1764b4957ea686701de45ea3f7eb0dd5ef8c6ddbb66539398ede5d9b8b630a6e52489487f41199a874e743d5e98b101292af4fae9c359ab6de9e9")
b2sums_i686=("289ef138bee276f14681cb805f199791cc4ac6c119ef7a32f9da6c3f8b10f91bab381eea9ea992080f3c0de0c680163827b4dc4dbaf9e77e75548bf6ab2308fd")

package(){
    install -Dm755 "$srcdir/ets" "$pkgdir/usr/bin/ets"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
