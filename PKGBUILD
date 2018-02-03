# Maintainer: Hans-Nikolai Viessmann (hv15 AT hw.ac.uk)
_pkgname=vsc-install
pkgname="python2-${_pkgname}"
pkgver=0.10.27
pkgrel=2
pkgdesc="Shared setuptools functions and classes for python libraries developed by UGent's HPC group"
arch=('any')
url="https://github.com/hpcugent/vsc-install"
license=('LGPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('f0a3b39fd984c9bbb21d33c1039fabc5')

package() {
  cd "${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

