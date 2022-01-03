
_project_name='aioftp'
pkgname="python-${_project_name}"
pkgver=0.20.0
pkgrel=1
pkgdesc="ftp client/server for asyncio"
url="https://github.com/aio-libs/aioftp"
arch=('any')
license=("Apache License Version 2.0")
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/58/b3/e46c2ee40b84b1d15568914faa9456d0c898e8bc117fd291c86ba1471fb1/aioftp-0.20.0.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

sha256sums=('37caa22ac58f6854ffb79a757921d2d01c9da17bf800beb2f203f8cf83fd7ec1')
