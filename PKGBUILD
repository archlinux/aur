# Maintainer: Laura Demkowicz-Duffy <dev[at]demkowiczduffy.co.uk>
pkgname=zigup-bin
_pkgname=zigup
pkgver=v2022_08_25
pkgrel=1
pkgdesc="Download and manage zig compilers"
arch=('x86_64')
url="https://github.com/marler8997/zigup"
license=('unknown')
provides=('zigup' 'zig')
conflicts=('zigup' 'zig')
source=("https://github.com/marler8997/$_pkgname/releases/download/$pkgver/zigup.ubuntu-latest-x86_64.zip")
sha256sums=('73ce7352d9b75d1e98a007bb2e0bc9b74442bac4f370ac0720e9851306bab443')

package() {
    install -Dm 0755 $_pkgname $pkgdir/usr/bin/$_pkgname
}
