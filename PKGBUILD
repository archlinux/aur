# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname='python-nexusformat'
_pkgname=nexusformat
pkgver=0.5.1
pkgrel=1
pkgdesc="Provides an API to open, create, and manipulate NeXus data."
url="https://github.com/nexpy/nexusformat"
arch=("any")
license=('BSD')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-h5py')
source=("https://github.com/nexpy/nexusformat/archive/v${pkgver}.tar.gz")
md5sums=('42dfd386cdf536e94efcbb704860737c')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
