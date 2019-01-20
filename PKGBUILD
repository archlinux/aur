pkgname=python-flask-misaka
pkgver=1.0.0
pkgrel=1
pkgdesc='Misaka bindings for Flask'
url='https://github.com/singingwolfboy/flask-misaka'
license=('MIT')
arch=('any')
depends=('python' 'python-flask' 'python-misaka' 'python-cffi')
makedepends=('python-setuptools')
source=("https://github.com/singingwolfboy/flask-misaka/archive/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/flask-misaka-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/flask-misaka-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkname}/LICENSE"
}

md5sums=('592280f4cdf5800226f77198611484b6')
sha1sums=('a393cb462fd1a8efbf0de97ae8687fad6e973acd')
sha256sums=('75b750d26273ebe347c93bf094385373e0450143759447ac315387924a90476f')
sha384sums=('ab4ae539cc0776d13937eee12a04e47e5234fc4ecc20e9739f526fa35149ac203959faf582e70e3034877284bf47d3f8')
sha512sums=('9b03be3829bfae4accabb99b21162f81a1fa2cc5fca2125848321bab6ff724a3abb335b621c6065b54611c7374df1bd1a2a68cbd0ba0b9f98bc96a34874f157e')
