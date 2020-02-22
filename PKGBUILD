# Maintainer: Sosthène Guédon <sosthene.gued@gmail.com>
pkgname=arm-linux-gnueabi-gcc75-linaro-bin
_name="gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf"
pkgver=7.5
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for 32-bit Armv7 Cortex-A"
arch=('x86_64')
url="https://www.linaro.org/downloads/"
license=('GPL')
depends=()
makedepends=()
md5sums=('7e5a330aed9dfbe69c79589911db29d9')

source=("$pkgname-v$pkgver::https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz")


package() {
    cd $_name
    mkdir -p "$pkgdir"/usr/lib/gcc
    mkdir -p "$pkgdir"/usr/share
    cp -r bin/ "$pkgdir"/usr/bin
    cp -r libexec/ "$pkgdir"/usr/libexec
    cp -r arm-linux-gnueabihf "$pkgdir"/usr/arm-linux-gnueabihf
    cp -r lib/gcc/arm-linux-gnueabihf "$pkgdir"/usr/lib/gcc/arm-linux-gnueabihf
    cp -r share/man/man1 "$pkgdir"/usr/share/man1
    cp -r share/man/man5 "$pkgdir"/usr/share/man5
    chmod -R 755 "$pkgdir"/usr
}
