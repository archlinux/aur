pkgname='python-aiorpcx'
pkgver=0.5.8
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

sha256sums=('3a309a9c8c48eaec17b479312334f1ca003d4c13b6f601508196a25d8f9cdb19')
