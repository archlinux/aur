# Maintainer: Angel de Vicente <angel.vicente.garrido at gmail dot com>
# Contributor: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname="hdf-eos-common"
pkgver=1.16
pkgrel=2
pkgdesc="Common headers files for HDF-EOS2 and HDF-EOS5"
url="http://www.hdfeos.org/software/library.php"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libaec' 'hdf5' 'hdf4' 'gdal' 'proj')
source=(https://git.earthdata.nasa.gov/rest/git-lfs/storage/DAS/hdfeos5/7054de24b90b6d9533329ef8dc89912c5227c83fb447792103279364e13dd452?response-content-disposition=attachment%3B%20filename%3D%22HDF-EOS5.1.16.tar.Z%22%3B%20filename*%3Dutf-8%27%27HDF-EOS5.1.16.tar.Z)
sha256sums=('7054de24b90b6d9533329ef8dc89912c5227c83fb447792103279364e13dd452')

package() {
  cd $srcdir/hdfeos5
  install -d -m755 $pkgdir/usr/include
  mv include/{cfortHdf.h,cproj.h,ease.h,isin.h} $pkgdir/usr/include/
  mv gctp/include/{bcea.h,cproj_prototypes.h,gctp_prototypes.h} $pkgdir/usr/include/
}
