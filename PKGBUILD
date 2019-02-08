pkgname='python-aiorpcx'
pkgver=0.10.4
pkgrel=1
pkgdesc="A generic asyncio library implementation of RPC suitable for an application that is a client, server or both."
url="https://github.com/kyuupichan/aiorpcX/"
arch=('any')
license=('MIT')
depends=('python>=3.6' 'python-attrs')
makedepends=('python-setuptools')
source=("https://github.com/kyuupichan/aiorpcX/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/aiorpcX-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/aiorpcX-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

sha256sums=('df79b7a321043ce5e12f91ad197d6187cf5b0c6f85506d323ad8b44e330104a1')
