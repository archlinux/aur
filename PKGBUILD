pkgname=python-transitions
pkgver=0.8.1
pkgrel=1
pkgdesc="A lightweight, object-oriented finite state machine implementation in Python"
url="http://github.com/tyarkoni/transitions"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python-six')
source=("https://github.com/tyarkoni/transitions/archive/${pkgver}.tar.gz")
sha256sums=('ecaf61fbfcf96e734cdf7e1f3c26e10149e92bb4c9ec82eadf787cbc7abe6155')

prepare() {
  cd "${srcdir}"/transitions-$pkgver
}

build() {
  cd "${srcdir}"/transitions-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/transitions-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


