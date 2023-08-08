pkgname=aocl-utils-aocc
pkgver=4.1
pkgrel=1
pkgdesc="AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs."
arch=('x86_64')
url="https://github.com/amd/aocl-utils"
license=('custom')
depends=('glibc' 'aocc')
provides=('aocl-utils')
conflicts=('aocl-utils')
makedepends=('python')
source=("local://aocl-utils-linux-aocc-4.1.0.tar.gz")
sha256sums=('7d2b1d7bdac2b16ec51b279d27a23a05c563724a40f845756b2b440535ccacd1')

package() {
    cd $srcdir/amd-utils
    mkdir $pkgdir/usr
    mv include lib $pkgdir/usr
}
