# Maintainer: feherneoh <feherneoh@gmail.com>

_target=aarch64-elf
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
sha512sums=('3a459bbb0edde275e4739f673b4e516df03097da7bb3aa5eb0d34b86d4075094bbd694d4cd95a6db5a230f2a860b0afdd08d036826fc57bef9587d936d687098')


package() {
	mkdir -p ${pkgdir}/usr/${_target}
	cp -a ${srcdir}/sysroot-newlib-linaro-${_pkgdate}-${_target}/usr/* ${pkgdir}/usr/${_target}
}
