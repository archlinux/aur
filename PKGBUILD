pkgbase=blas-mkl
pkgname=(blas-mkl blas64-mkl)
pkgver=1
pkgrel=1
epoch=1
arch=(x86_64)
pkgdesc="Intel oneAPI Math Kernel Library (Provides BLAS/CBLAS/LAPACK/LAPACKE system-wide)"
url="https://software.intel.com/content/www/us/en/develop/tools/oneapi.html"
license=('custom')

package_blas-mkl() {
    depends=('intel-oneapi-mkl')
    provides=('blas' 'cblas' 'lapack' 'lapacke')
    conflicts=('blas' 'cblas' 'lapack' 'lapacke')

    mkdir -p "$pkgdir"/usr/lib
    mkdir -p "$pkgdir"/usr/include
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/libblas.so
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/libblas.so.3
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/libcblas.so
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/libcblas.so.3
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/liblapack.so
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/liblapack.so.3
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/liblapacke.so
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/liblapacke.so.3
    ln -s /opt/intel/oneapi/mkl/latest/include/mkl_cblas.h "$pkgdir"/usr/include/cblas.h
}

package_blas64-mkl() {
    depends=('intel-oneapi-mkl')
    provides=('blas64' 'cblas64' 'lapack64' 'lapacke64')
    conflicts=('blas64' 'cblas64' 'lapack64' 'lapacke64')

    mkdir -p "$pkgdir"/usr/lib
    mkdir -p "$pkgdir"/usr/include
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/libblas64.so
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/libblas64.so.3
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/libcblas64.so
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/libcblas64.so.3
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/liblapack64.so
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/liblapack64.so.3
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/liblapacke64.so
    ln -s /opt/intel/oneapi/mkl/latest/lib/libmkl_rt.so.2 "$pkgdir"/usr/lib/liblapacke64.so.3
    ln -s /opt/intel/oneapi/mkl/latest/include/mkl_cblas_64.h "$pkgdir"/usr/include/cblas_64.h
}
