# Maintainer: Jia Li <lijia1608@gmail.com>
pkgname=python2-pyscf
pkgver=1.4.5
pkgrel=1
pkgdesc="Python-based Simulations of Chemistry Framework"
arch=(i686 x86_64)
url="http://sunqm.github.io/pyscf"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-h5py' 'xcfun' 'libcint' 'libxc')
makedepends=('cmake')
provides=($pkgname=$pkgver)
source=("https://github.com/sunqm/pyscf/archive/v$pkgver.tar.gz")
md5sums=('aa9795b64fd4c22f5da305582d206271')

package() {
    cd "pyscf-$pkgver"
    PYSCF_INC_DIR=/usr/lib python2 setup.py install --root="$pkgdir/" --optimize=1
}
