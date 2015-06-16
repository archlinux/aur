# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-txaio"
pkgname="${_pkgname}"
pkgver=1.0.0
pkgrel=2
pkgdesc="Utilities to support code that runs unmodified on Twisted and asyncio"
arch=('any')
url="https://github.com/tavendo/txaio"
license=('APACHE')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/tavendo/txaio/archive/v${pkgver}.tar.gz)
md5sums=('7458da55b8c5807f2655e8fc55963891')

package(){
  cd "${srcdir}/txaio-${pkgver}"
   python setup.py install --root="$pkgdir" --prefix=/usr
}

