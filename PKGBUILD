# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>
pkgname="python2-alexandra"
_srcname="python-alexandra"
pkgver="0.3.0"
pkgrel="0"
pkgdesc="Toolkit for writing Amazon Alexa skills as web services."
arch=('any')
url="https://github.com/erik/alexandra"
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/72/05/949cdfa536f4a1d601afefd99240dfaaf839a60656fd1416768e71b9bbf5/alexandra-0.3.0.tar.gz")
md5sums=('65f64b5514236bfc7d7b9ace27cc7fb3')

package() {
  cd "${srcdir}/alexandra-${pkgver}"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

