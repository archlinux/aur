
_project_name='aioftp'
pkgname="python-${_project_name}"
pkgver=0.21.3
pkgrel=1
pkgdesc="ftp client/server for asyncio"
url="https://github.com/aio-libs/aioftp"
arch=('any')
license=("Apache License Version 2.0")
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://pypi.io/packages/source/${_project_name:0:1}/${_project_name}/${_project_name}-${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

sha256sums=('c6dae50b3aa07f095b2d93a837d636dd93f235aaafe54adef82be0f8e5567fd2')
