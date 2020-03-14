pkgname=python-condastats
pkgver=0.1.3
pkgrel=1
pkgdesc="Conda package stats CLI"
arch=(any)
url="https://github.com/sophiamyang/condastats"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-fastparquet' 'python-snappy' 'python-s3fs' 'python-dask')
source=("https://pypi.io/packages/source/c/condastats/condastats-$pkgver.tar.gz")
sha256sums=('504a41ecb9edf0bd7798847b61839954e50508c5235ec7ee48c539ce46b4fa18')

package() {
  cd condastats-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
