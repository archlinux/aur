#Maintainer: Egor <2ttkysslm@mozmail.com>
_target=i686-elf
pkgname=$_target-binutils-bin
pkgver=2.41
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the i686-elf target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=('GPL')
depends=(zlib libelf)
conflicts=(i686-elf-binutils)
source=("$pkgname-$pkgver.zip::https://github.com/nasOS-official/i686-elf-binutils/releases/download/main/release.zip")
sha256sums=('SKIP')
package(){
cp -r usr ${pkgdir}
}
