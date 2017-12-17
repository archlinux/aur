# Maintainer: zargbell <zargbell@yandex.ru>

_target=aarch64-elf
_pkgdate=2017.11
_pkgver=7.2

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
sha512sums=('9cafca6170639b261edb235bee148fc1da17225bd6f0910afef51049c6f24c54066cb3f5b007e398cc2b961a3f8b1775738d94775b89523480b0f0b1f5c4c72a')


package() {
	mkdir -p ${pkgdir}/usr/${_target}
	cp -a ${srcdir}/sysroot-newlib-linaro-${_pkgdate}-${_target}/usr/* ${pkgdir}/usr/${_target}
}
