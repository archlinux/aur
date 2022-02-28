
_project_name='aioftp'
pkgname="python-${_project_name}"
pkgver=0.20.1
pkgrel=1
pkgdesc="ftp client/server for asyncio"
url="https://github.com/aio-libs/aioftp"
arch=('any')
license=("Apache License Version 2.0")
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/56/3c/6d328f641aae03762331461a56bdc0f01a8cfcd44bf8c3450cdd514218dc/aioftp-0.20.1.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

sha256sums=('ea9de7e6d34d42b6f01ea1915d834be3e71fdf5065c767bd7a5c57ebfc318ffe')
