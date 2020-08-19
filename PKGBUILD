
_project_name='aioftp'
pkgname="python-${_project_name}"
pkgver=0.17.1
pkgrel=1
pkgdesc="ftp client/server for asyncio"
url="https://github.com/aio-libs/aioftp"
arch=('any')
license=("Apache License Version 2.0")
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/d8/e8/e0393cf55c48b86da28ecc0c13088605f22418ef9879e1c639ba689fe753/aioftp-0.17.1.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('ea71378fe1f45c775a9d98766e3f6749')
