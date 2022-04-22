
_project_name='aioftp'
pkgname="python-${_project_name}"
pkgver=0.21.2
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

sha256sums=('256cde05d08f5cb60c98a92f0aa41017f987a116dd46f8f4bca545e3e0fc2d22')
