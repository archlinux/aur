# Maintainer: Blue Gummi <thatstealthyowl@gmail.com> 
pkgname=belle-cpu
pkgver=0.2.0
pkgrel=1
pkgdesc="BELLE - The Big Endian, Low Level Emulator"
arch=('x86_64')
url="https://belle-cpu.xyz"
license=('BSD-3-Clause')
source=("https://github.com/BlueGummi/belle/releases/download/nightly/belle-nightly-linux-x86_64.tar.gz")
md5sums=('e5479c09a84243a2649b0367eed91820')

package() {
    cd "$srcdir"
    tar -xf belle.tar.gz
    install -Dm755 "$srcdir/bin/basm" "$pkgdir/usr/bin/basm"
    install -Dm755 "$srcdir/bin/belle" "$pkgdir/usr/bin/belle"
    install -Dm755 "$srcdir/bin/bdump" "$pkgdir/usr/bin/bdump"
    install -Dm755 "$srcdir/bin/bfmt" "$pkgdir/usr/bin/bfmt"
}
