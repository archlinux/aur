# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=('cython-kivy')
pkgver=0.23
pkgrel=1
pkgdesc="C-Extensions for Python; Kivy-compatible version"
arch=(i686 x86_64)
url="http://www.cython.org"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
provides=('cython=${pkgver}')
conflicts=('cython')
source=("http://cython.org/release/Cython-$pkgver.tar.gz")
sha256sums=('9fd01e8301c24fb3ba0411ad8eb16f5d9f9f8e66b1281fbe7aba2a9bd9d343dc')

package() {
  cd "${srcdir}/Cython-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
