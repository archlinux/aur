# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python2-urutu
pkgver=1.1
pkgrel=1
pkgdesc="A Python based parallel programming library for GPUs"
url="https://github.com/urutu/Urutu"
arch=(any)
license=('apache')
depends=('python2' 'python2-pycuda')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=(https://github.com/urutu/Urutu/archive/v$pkgver.zip)

#check() {
#    cd $srcdir/Urutu-"$pkgver"
#    nosetests2
#}

package() {
    cd $srcdir/Urutu-"$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=('09e3ff0157d1aef4bf486839c3361fe3')
