# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python2-pims
pkgver=0.2.2
pkgrel=2
pkgdesc="Python Image Sequence: Load video and sequential images"
url="https://github.com/soft-matter/pims"
arch=(any)
license=('BSD')
depends=('python2' 'python2-tifffile')
makedepends=('python2-setuptools' 'python2-scipy' 'python2-matplotlib' 'python2-scikit-image')
checkdepends=('python2-nose')
source=(https://github.com/soft-matter/pims/archive/v$pkgver.zip)

#check() {
#    cd $srcdir/pims-"$pkgver"
#    nosetests2
#}

package() {
    cd $srcdir/pims-"$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('6e7aa05d83184af37b094135c025dedf')
