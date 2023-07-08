pkgbase=blas-aocl
pkgname=(blas-aocl-gcc blas64-aocl-gcc blas-aocl-aocc blas64-aocl-aocc)
pkgver=4.0.0
pkgrel=2
arch=(x86_64)
pkgdesc="AMD Optimizing CPU Libraries (Provides BLAS/CBLAS/LAPACK/LAPACKE system-wide)"
url="https://developer.amd.com/amd-aocl/"
license=('custom')

package_blas-aocl-gcc() {
    depends=('aocl-gcc')
    provides=('blas' 'cblas' 'lapack' 'lapacke')
    conflicts=('blas' 'cblas' 'lapack' 'lapacke')

    mkdir -p "$pkgdir"/usr/lib
    mkdir -p "$pkgdir"/usr/include
    ln -s /opt/aocl-gcc/lib_LP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libblas.so
    ln -s /opt/aocl-gcc/lib_LP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libblas.so.3
    ln -s /opt/aocl-gcc/lib_LP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libcblas.so
    ln -s /opt/aocl-gcc/lib_LP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libcblas.so.3
    ln -s /opt/aocl-gcc/lib_LP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapack.so
    ln -s /opt/aocl-gcc/lib_LP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapack.so.3
    ln -s /opt/aocl-gcc/lib_LP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapacke.so
    ln -s /opt/aocl-gcc/lib_LP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapacke.so.3
    ln -s /opt/aocl-gcc/include_LP64/cblas.h "$pkgdir"/usr/include/cblas.h
    ln -s /opt/aocl-gcc/include_LP64/cblas.hh "$pkgdir"/usr/include/cblas.hh
    ln -s /opt/aocl-gcc/include_LP64/lapack.h "$pkgdir"/usr/include/lapack.h
    ln -s /opt/aocl-gcc/include_LP64/lapacke.h "$pkgdir"/usr/include/lapacke.h
    ln -s /opt/aocl-gcc/include_LP64/lapacke_mangling.h "$pkgdir"/usr/include/lapacke_mangling.h

}

package_blas64-aocl-gcc() {
    depends=('aocl-gcc')
    provides=('blas64' 'cblas64' 'lapack64' 'lapacke64')
    conflicts=('blas64' 'cblas64' 'lapack64' 'lapacke64')

    mkdir -p "$pkgdir"/usr/lib
    ln -s /opt/aocl-gcc/lib_ILP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libblas64.so
    ln -s /opt/aocl-gcc/lib_ILP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libblas64.so.3
    ln -s /opt/aocl-gcc/lib_ILP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libcblas64.so
    ln -s /opt/aocl-gcc/lib_ILP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libcblas64.so.3
    ln -s /opt/aocl-gcc/lib_ILP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapack64.so
    ln -s /opt/aocl-gcc/lib_ILP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapack64.so.3
    ln -s /opt/aocl-gcc/lib_ILP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapacke64.so
    ln -s /opt/aocl-gcc/lib_ILP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapacke64.so.3

}

package_blas-aocl-aocc() {
    depends=('aocl-aocc')
    provides=('blas' 'cblas' 'lapack' 'lapacke')
    conflicts=('blas' 'cblas' 'lapack' 'lapacke')

    mkdir -p "$pkgdir"/usr/lib
    mkdir -p "$pkgdir"/usr/include
    ln -s /opt/aocl-aocc/lib_LP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libblas.so
    ln -s /opt/aocl-aocc/lib_LP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libblas.so.3
    ln -s /opt/aocl-aocc/lib_LP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libcblas.so
    ln -s /opt/aocl-aocc/lib_LP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libcblas.so.3
    ln -s /opt/aocl-aocc/lib_LP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapack.so
    ln -s /opt/aocl-aocc/lib_LP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapack.so.3
    ln -s /opt/aocl-aocc/lib_LP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapacke.so
    ln -s /opt/aocl-aocc/lib_LP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapacke.so.3
    ln -s /opt/aocl-aocc/include_LP64/cblas.h "$pkgdir"/usr/include/cblas.h
    ln -s /opt/aocl-aocc/include_LP64/cblas.hh "$pkgdir"/usr/include/cblas.hh
    ln -s /opt/aocl-aocc/include_LP64/lapack.h "$pkgdir"/usr/include/lapack.h
    ln -s /opt/aocl-aocc/include_LP64/lapacke.h "$pkgdir"/usr/include/lapacke.h
    ln -s /opt/aocl-aocc/include_LP64/lapacke_mangling.h "$pkgdir"/usr/include/lapacke_mangling.h

}

package_blas64-aocl-aocc() {
    depends=('aocl-aocc')
    provides=('blas64' 'cblas64' 'lapack64' 'lapacke64')
    conflicts=('blas64' 'cblas64' 'lapack64' 'lapacke64')

    mkdir -p "$pkgdir"/usr/lib
    ln -s /opt/aocl-aocc/lib_ILP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libblas64.so
    ln -s /opt/aocl-aocc/lib_ILP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libblas64.so.3
    ln -s /opt/aocl-aocc/lib_ILP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libcblas64.so
    ln -s /opt/aocl-aocc/lib_ILP64/libblis-mt.so.4.0.0 "$pkgdir"/usr/lib/libcblas64.so.3
    ln -s /opt/aocl-aocc/lib_ILP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapack64.so
    ln -s /opt/aocl-aocc/lib_ILP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapack64.so.3
    ln -s /opt/aocl-aocc/lib_ILP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapacke64.so
    ln -s /opt/aocl-aocc/lib_ILP64/libflame.so.4.0 "$pkgdir"/usr/lib/liblapacke64.so.3

}



