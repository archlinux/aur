
_project_name='aioftp'
pkgname="python-${_project_name}"
pkgver=0.21.0
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

sha256sums=('4f03917c287299a0789394370803e3b0f6935e241d8f28bbb367c2379a934f92')
