# Maintainer: Vitaliy Klychkov <vitassuper99@gmail.com>

_target=arm-linux-gnueabihf
_pkgdate=2015.11-2


pkgname=${_target}-gcc-linaro-bin
pkgver=5.2
pkgrel=1
epoch=
pkgdesc="The GNU Compiler Collection - cross compiler for ARM EABI hard float target."
arch=('x86_64')
url="http://www.linaro.org/downloads/"
license=('GPL' 'LGPL')
groups=(${_target}-toolchain-linaro-bin)
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("${_target}-gcc")
replaces=("${_target}-gcc")
backup=()
options=(!emptydirs !strip staticlibs)
install=
changelog=
source=(http://releases.linaro.org/components/toolchain/binaries/${pkgver}-${_pkgdate}/${_target}/gcc-linaro-${pkgver}-${_pkgdate}-x86_64_${_target}.tar.xz)
sha512sums=('4bd7eae5a85d04f29c3f70e1a25a1cc2aa99a40c4926ed5cc21b5a16807a9f3eefd7c1c476e348a29d325f23150a65feab3c3b977c115170ccfcf73473ae139a')


package() {
	mkdir -p ${pkgdir}/usr
	cp -a ${srcdir}/gcc-linaro-${pkgver}-${_pkgdate}-x86_64_${_target}/* ${pkgdir}/usr

	rm -f 	${pkgdir}/usr/*-manifest.txt
	rm -f 	${pkgdir}/usr/bin/runtest
	rm -f 	${pkgdir}/usr/lib/lib*
	rm -rf 	${pkgdir}/usr/include
	rm -rf 	${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale}
	rm -rf 	${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
sha512sums=('4bd7eae5a85d04f29c3f70e1a25a1cc2aa99a40c4926ed5cc21b5a16807a9f3eefd7c1c476e348a29d325f23150a65feab3c3b977c115170ccfcf73473ae139a')
