# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=ccstudio-arm-gnu-rm-toolchain
_pkgname=gcc-arm-none-eabi-10-2020-q2-preview
pkgver=10.2020.2
_pkgver=10-2020q2
pkgrel=1
pkgdesc='Code Composer Studio GNU Embedded Toolchain for ARM Cortex-R/M'
arch=('x86_64')
url='https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm'
depends=('ccstudio')
license=('GPL')
source=("https://developer.arm.com/-/media/Files/downloads/gnu-rm/${_pkgver}/${_pkgname}-x86_64-linux.tar.bz2")
md5sums=('2d19775c5aa091b7f55a68727c5d7d76')

package() {
    mkdir -m 0775 -p "${pkgdir}/opt/ccstudio/ccs/tools/compiler/"
    cp -Rv "${srcdir}/${_pkgname}" "${pkgdir}/opt/ccstudio/ccs/tools/compiler/"
}
