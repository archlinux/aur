pkgname='python-aiorpcx'
pkgver=0.7.0
pkgrel=1
pkgdesc="A generic asyncio library implementation of RPC suitable for an application that is a client, server or both."
url="https://github.com/kyuupichan/aiorpcX/"
arch=('any')
license=('MIT')
depends=('python>=3.6')
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

sha256sums=('af1bfb3cc317826564cea34556331f84f551fbf0f11c490b4f2ee6049e0f082c')
