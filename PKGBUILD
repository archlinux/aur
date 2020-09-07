
_project_name='aioftp'
pkgname="python-${_project_name}"
pkgver=0.18.0
pkgrel=1
pkgdesc="ftp client/server for asyncio"
url="https://github.com/aio-libs/aioftp"
arch=('any')
license=("Apache License Version 2.0")
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/55/c8/2301ef2569d70badd0e5dbfcebb3ed0224b9cabafd3bb169930f328e7feb/aioftp-0.18.0.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('8e8633b4bcc06bf1eae305700c3378ce')
