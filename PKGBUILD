# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=('python-pybrain')
pkgver=0.3.1
pkgrel=1
pkgdesc='A modular Machine Learning Library for Python'
arch=('i686' 'x86_64')
url='http://pybrain.org/'
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools' 'git')
source=("pybrain-$pkgver.zip::https://github.com/pybrain/pybrain/zipball/$pkgver")
sha512sums=('eb495b361464226e0c5b167f2edfa4876fc7c81856fdbc1e3069787a453ea345dcf314fd5c09fd694dd9c6ebe5b1d619b48c650b33b86ed9c510ecf8c26d9db0')

build() {
  cd pybrain-pybrain-*
  python setup.py build
}

package() {
  cd pybrain-pybrain-*
  python setup.py install --root="${pkgdir}" --optimize=1
}
