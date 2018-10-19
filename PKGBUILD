# Maintainer: Andrew Anderson <andersan@tcd.ie>
pkgname=trinnity
pkgver=0.4
pkgrel=1
pkgdesc="C++ library of CNN primitive operations"
arch=('x86_64' 'aarch64')
url="https://bitbucket.org/STG-TCD/trinnity"
license=('BSD')
groups=()
depends=()
makedepends=('doxygen')
checkdepends=()
optdepends=('gsl>=2.3: GSL BLAS backend'
            'atlas-lapack>=3.10.3: ATLAS BLAS backend'
            'openblas-lapack>=0.2.19: OpenBLAS BLAS backend'
            'intel-mkl>=2017.17.0.1.1.132: Intel MKL BLAS backend'
            'clblas>=2.12: clBLAS BLAS backend'
            )
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://bitbucket.org/STG-TCD/trinnity/get/v0.4.tar.bz2")
md5sums=('6ebb1e996cc50c3e2cdb48c7834fbb4d')
sha1sums=('4d433eef9f4965ace23b378f1fa6918ba799b323')

package() {
  make -C $srcdir/STG-* DESTDIR=$pkgdir doc
  make -C $srcdir/STG-* DESTDIR=$pkgdir install
}
