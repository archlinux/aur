# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: McNoggins <gagnon88 at Gmail dot com>

pkgname="python-imread"
pkgver=0.6
pkgrel=1
pkgdesc="Mahotas-imread is a library to read & write numpy arrays"
arch=('any')
url="https://pypi.python.org/pypi/imread/"
license=('MIT')
depends=('python' 'libpng' 'libtiff' 'libwebp' 'python-numpy')
makedepends=('python-setuptools')
provides=('python-imread')
source=("https://pypi.python.org/packages/7a/c8/ab440ea4b304b9f9371f5329c4209b049432f667a5085a6b6f1ab2ebcdd3/imread-0.6.tar.gz")
sha1sums=('65777cd9e5e984229f8db84038cd2e187bd6ef26')

package() {
  cd $srcdir/imread-$pkgver

  python setup.py install --root=$pkgdir --optimize=1
}
