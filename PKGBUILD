pkgname=aocl-utils
pkgver=4.1
pkgrel=1
pkgdesc="AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs."
arch=('x86_64')
url="https://github.com/amd/aocl-utils"
license=('custom')
depends=('glibc')
source=("local://aocl-utils-linux-gcc-4.1.0.tar.gz")
sha256sums=('549ee64074b4193e1ec5db928defe157709f09689aba4a7a4037c84ba1c4f7f1')

package() {
    cd $srcdir/amd-utils
    mkdir $pkgdir/usr
    mv include lib $pkgdir/usr
}
