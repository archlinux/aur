# Maintainer:Integral<luckys68@126.com>
pkgname=qemu-patch-raspberry4
pkgver=6.2.50
pkgrel=2
pkgdesc="A patched version of QEMU 6.2.50 for Raspberry4."
arch=('x86_64')
url="http://www.qemu.org/"
license=('GPL')
makedepends=('git' 'ninja' 'python')
conflicts=('qemu-headless' 'qemu' 'qemu-desktop')
provides=('qemu-headless' 'qemu')
source=(
    "git+https://github.com/Integral-Tech/qemu-patch-raspberry4"
)
sha512sums=('SKIP')

package() {
    cd ${pkgname}/
    mkdir build
    cd build/
    ../configure
    make install
}
