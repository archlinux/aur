# Maintainer: Laura Demkowicz-Duffy <dev[at]demkowiczduffy.co.uk>
pkgname=zigup-bin
_pkgname=zigup
pkgver=v2023_07_27
pkgrel=1
pkgdesc="Download and manage zig compilers"
arch=('x86_64')
url="https://github.com/marler8997/zigup"
license=('unknown')
provides=('zigup' 'zig')
conflicts=('zigup' 'zig')
source=("https://github.com/marler8997/$_pkgname/releases/download/$pkgver/zigup.ubuntu-latest-x86_64.zip")
sha256sums=('6e3d4111a5feafedd4770ac819501f42b6fbe80df6cfc6558aaa73c8907037d5')

package() {
    install -Dm 0755 $_pkgname $pkgdir/usr/bin/$_pkgname
}
