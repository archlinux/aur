#Maintainer GI_Jack <GI_Jack@hackermail.com>

pkgname=python2-shutilwhich
pkgver=1.1.0
pkgrel=2
pkgdesc="shutil.which for those not using Python 3.3 yet."
url="http://github.com/mbr/shutilwhich"
depends=('python2' )
makedepends=('python2')
license=('PSF')
arch=('any')
source=(https://pypi.python.org/packages/source/s/shutilwhich/shutilwhich-$pkgver.tar.gz)
md5sums=('915947c5cdae7afd748ac715ee547adb')

package() {
    cd $srcdir/shutilwhich-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
    chmod -R a+r ${pkgdir}/usr/lib/python2.?/
}
