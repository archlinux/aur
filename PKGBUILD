# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=hdf-eos-common
pkgver=1.15
pkgrel=1
pkgdesc="Common headers files for HDF-EOS2 and HDF-EOS5"
url="http://www.hdfeos.org/software/library.php"
license=('GPL')
arch=('i686' 'x86_64')
source=(ftp://edhs1.gsfc.nasa.gov/edhs/hdfeos5/latest_release/HDF-EOS5.$pkgver.tar.Z)
md5sums=('5d607a13dd42e559bfc90e278a8ec919')

package() {
  cd $srcdir/hdfeos5
  install -d -m755 $pkgdir/usr/include
  mv include/{cfortHdf.h,cproj.h,ease.h,isin.h,proj.h} $pkgdir/usr/include/
  mv gctp/include/{bcea.h,cproj_prototypes.h,gctp_prototypes.h} $pkgdir/usr/include/
}
