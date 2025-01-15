# Maintainer: Blue Gummi <thatstealthyowl@gmail.com> 
pkgname=belle-cpu-git
pkgver=0.2.0
pkgrel=1
provides=(belle-cpu)
conflicts=(belle-cpu)
pkgdesc="The Big Endian, Low Level Emulator"
arch=('any')
url="https://belle-cpu.xyz/"
license=('BSD-3-Clause')
makedepends=('make' 'cargo' 'git' 'bash')
source=("git+https://github.com/BlueGummi/belle.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/belle"
    ./build.sh -w
}

package() {
    cd "$srcdir/belle"
    ./install.sh -c
}

