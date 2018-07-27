# Maintainer: zargbell <zargbell@yandex.ru>

_target=aarch64-elf
_pkgdate=2018.05
_pkgver=7.3

pkgname=${_target}-newlib-linaro-bin
pkgver=${_pkgdate}
pkgrel=1
epoch=
pkgdesc="A C standard library implementation intended for use on embedded systems ARM64 (bare metal)"
arch=('x86_64')
url="http://www.linaro.org/downloads/"
license=('BSD')
groups=(${_target}-toolchain-linaro-bin)
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs !strip)
install=
changelog=
source=(http://releases.linaro.org/components/toolchain/binaries/${_pkgver}-${_pkgdate}/${_target}/sysroot-newlib-linaro-${_pkgdate}-${_target}.tar.xz)
sha512sums=('eae58fecd20751d41dbb940d059a668834de8beadc37a8203ba62dd7e3184c529e1a6cb695c09a32f971409bca00ee88863b87a963beef876274d90fa01b80af')


package() {
	mkdir -p ${pkgdir}/usr/${_target}
	cp -a ${srcdir}/sysroot-newlib-linaro-${_pkgdate}-${_target}/usr/* ${pkgdir}/usr/${_target}
}
