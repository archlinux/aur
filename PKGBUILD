pkgname='python-aiorpcx'
pkgver=0.7.1
pkgrel=2
pkgdesc="A generic asyncio library implementation of RPC suitable for an application that is a client, server or both."
url="https://github.com/kyuupichan/aiorpcX/"
arch=('any')
license=('MIT')
depends=('python>=3.6', 'python-attrs')
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

sha256sums=('b9baeab3e72177baa9696292d167e5f5cdf11c1696194b29e059f8665a195dc0')
