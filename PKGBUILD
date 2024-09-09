#Maintainer: Egor <2ttkysslm@mozmail.com>
_target=i686-elf
pkgname=$_target-gcc-bin
pkgver=11.2.0
pkgrel=1
pkgdesc="GNU gcc for the i686- toolchain"
arch=(x86_64)
url='https://www.gnu.org/software/gcc'
license=('GPL')
depends=(xz libmpc i686-elf-binutils-bin)
conflicts=(i686-elf-gcc)
source=("$pkgname-$pkgver.zip::https://github.com/nasOS-official/i686-elf-gcc/releases/download/main/release.zip")
sha256sums=('SKIP')
package(){
cp -r usr ${pkgdir}
}

