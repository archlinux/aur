
pkgname=python-pyttsx3
pkgver=2.7
pkgrel=1
pkgdesc="Pyttsx for python3"
arch=('any')
url="https://github.com/nateshmbhat/pyttsx3"
license=('BSD')
depends=('python' 'espeak')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/pyttsx3/pyttsx3-${pkgver}.tar.gz")
md5sums=('edc3a70db52a902bdfd72f875a6a7237')

build() {
  cd "${srcdir}/pyttsx3-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/pyttsx3-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
