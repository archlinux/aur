# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Fangfei Yang <yangff1@gmail.com>
pkgname=kendryte-toolchain-bin
pkgver=8.2.0_20190213
pkgrel=1
epoch=
pkgdesc="RISC-V 64bit toolchain for Kendryte K210"
arch=('x86_64')
url="https://github.com/kendryte/kendryte-gnu-toolchain"
license=('GPL')
groups=()
depends=("mpfr" "isl19")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://github.com/kendryte/kendryte-gnu-toolchain/releases/download/-${pkgver//_/-}.tar.gz/kendryte-toolchain-ubuntu-amd64-${pkgver//_/-}.tar.gz")
noextract=("kendryte-toolchain-ubuntu-amd64-${pkgver//_/-}.tar.gz")
sha512sums=("6721687837d408d9b118e4ff9a96d4910615675cc4c2f36e4774c2241ac728ea2a982b81a9b86e8f3d49325f0fc2f3b71975c4937968efd2fc3568e76b5b46ab")
validpgpkeys=()

package() {
	mkdir -p $pkgdir/opt/riscv-toolchain
	tar xzf kendryte-toolchain-ubuntu-amd64-${pkgver//_/-}.tar.gz  -C $pkgdir/opt/riscv-toolchain kendryte-toolchain/ --strip-components 1
}
