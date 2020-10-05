
_project_name='aioftp'
pkgname="python-${_project_name}"
pkgver=0.18.1
pkgrel=1
pkgdesc="ftp client/server for asyncio"
url="https://github.com/aio-libs/aioftp"
arch=('any')
license=("Apache License Version 2.0")
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/b8/57/dfa5657e2feaa99a3ff1222ef6956f649a7b5d5f996c1d335272f8bb5e48/aioftp-0.18.1.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('1220d1c3c7faf4ae80fb8fc84c224f81')
