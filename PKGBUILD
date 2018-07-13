pkgname='python-aiorpcx'
pkgver=0.5.6
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

sha256sums=('4570765a55e3dc6d0b55dc4515166501e88d816df417913a155a102a5214b12c')
