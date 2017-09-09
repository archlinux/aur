# Maintainer: zargbell <zargbell@yandex.ru>

_target=aarch64-elf
_pkgdate=2017.08
_pkgver=7.1

pkgname=${_target}-newlib-linaro-bin
pkgver=2.5.0
pkgrel=1
epoch=
pkgdesc="A C standard library implementation intended for use on embedded systems ARM64 (bare metal)"
arch=('x86_64')
url="http://www.linaro.org/downloads/"
license=('BSD')
groups=(${_target}-linaro-toolchain-bin)
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
sha512sums=('de8860a939721c588484072d293b98a892669cc8b5b0089c41a82f2cdab136a38b502e5f180537e5ce59fe80cffab6dc396895c6d9bf9b6e32ce6d076688290c')


package() {
	mkdir -p ${pkgdir}/usr/${_target}
	cp -a ${srcdir}/sysroot-newlib-linaro-${_pkgdate}-${_target}/usr/* ${pkgdir}/usr/${_target}
}
