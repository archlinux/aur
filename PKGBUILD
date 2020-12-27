# Maintainer: feherneoh <feherneoh@gmail.com>

_target=arm-eabi
_pkgdate=2019.12
_pkgver=7.5

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
sha512sums=('735d6c3cc1081b42b5a40b4d0065d9a34a879de5d16bb244510b0b1092f69d008a0d01897c0ef3957ae63bd93b2dd1fee88f42f521bdff5fa958b3a62fe53928')


package() {
	mkdir -p ${pkgdir}/usr/${_target}
	cp -a ${srcdir}/sysroot-newlib-linaro-${_pkgdate}-${_target}/usr/* ${pkgdir}/usr/${_target}
}
