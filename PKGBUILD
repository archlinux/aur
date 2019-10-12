# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-nexusformat'
_pkgname=nexusformat
pkgver=0.4.20
pkgrel=1
pkgdesc="Provides an API to open, create, and manipulate NeXus data."
url="https://github.com/nexpy/nexusformat"
arch=("any")
license=('BSD')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-h5py')
source=("https://github.com/nexpy/nexusformat/archive/v${pkgver}.tar.gz")
md5sums=('3597830bb33bb272f1e507fc373de7c6')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
