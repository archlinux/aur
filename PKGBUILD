
_project_name='aioftp'
pkgname="python-${_project_name}"
pkgver=0.17.2
pkgrel=1
pkgdesc="ftp client/server for asyncio"
url="https://github.com/aio-libs/aioftp"
arch=('any')
license=("Apache License Version 2.0")
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/ad/6e/82c467706e0c7190c73d1e76306226244e44b0c32de212f78274ca958225/aioftp-0.17.2.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('a038eae8a2ec4443996c11c371540464')
