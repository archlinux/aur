# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-pims
pkgver=0.2.2
pkgrel=2
pkgdesc="Python Image Sequence: Load video and sequential images"
url="https://github.com/soft-matter/pims"
arch=(any)
license=('BSD')
depends=('python' 'python-tifffile')
makedepends=('python-setuptools' 'python-scipy' 'python-matplotlib' 'python-scikit-image')
checkdepends=('python-nose')
source=(https://github.com/soft-matter/pims/archive/v$pkgver.zip)

#check() {
#    cd $srcdir/pims-"$pkgver"
#    nosetests3
#}

package() {
    cd $srcdir/pims-"$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('6e7aa05d83184af37b094135c025dedf')
