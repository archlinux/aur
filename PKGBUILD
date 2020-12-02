pkgname=('python-stagger')
pkgver=1.0.1
pkgrel=3
pkgdesc="ID3v1/ID3v2 tag manipulation package in pure Python 3"
arch=('any')
url="http://github.com/lorentey/stagger"
makedepends=('python-setuptools')
source=("https://github.com/lorentey/stagger/archive/release-${pkgver}.tar.gz")
md5sums=('b4b141bc36cfda0d6f9b2d40cff3b346')

build() {
  cd ${srcdir}/stagger-release-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/stagger-release-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}
