# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-pims
pkgver=0.3.2
pkgrel=1
pkgdesc="Python Image Sequence: Load video and sequential images"
url="https://github.com/soft-matter/pims"
arch=(any)
license=('BSD')
depends=('python' 'python-slicerator')
optdepends=('python-pillow: improved TIFF support'
            'python-tifffile: alternative TIFF support')
makedepends=('python-setuptools' 'python-scipy' 'python-matplotlib' 'python-scikit-image')
checkdepends=('python-nose')
source=(https://github.com/soft-matter/pims/archive/v$pkgver.zip)

# the fix will come with 0.3.3
#check() {
#    cd $srcdir/pims-"$pkgver"
#    nosetests3
#}

package() {
    cd $srcdir/pims-"$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('3c6ed29354af5b1e1d64addf5e6b0c6d')
