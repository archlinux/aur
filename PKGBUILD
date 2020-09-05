pkgname=python-transitions
pkgver=0.8.2
pkgrel=1
pkgdesc="A lightweight, object-oriented finite state machine implementation in Python"
url="http://github.com/tyarkoni/transitions"
arch=(any)
license=('MIT')
makedepends=('python-setuptools')
depends=('python-six')
source=("https://github.com/tyarkoni/transitions/archive/${pkgver}.tar.gz")
sha256sums=('5e118a0ea9ed1f56737b0f0f0c30b9b054c0168c1d35508cd7bd4039dc26e1fe')

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


