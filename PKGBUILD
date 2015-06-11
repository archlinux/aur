# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=('cython-kivy')
pkgver=0.21.2
pkgrel=1
pkgdesc="C-Extensions for Python; Kivy-compatible version"
arch=(i686 x86_64)
url="http://www.cython.org"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
conflicts=('cython')
source=("http://cython.org/release/Cython-$pkgver.tar.gz")
sha256sums=('b01af23102143515e6138a4d5e185c2cfa588e0df61c0827de4257bac3393679')

package() {
  cd "${srcdir}/Cython-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
