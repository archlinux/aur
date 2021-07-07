# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-base45
pkgname=('python-base45')
_name=${pkgbase#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc="A Python module to encode/decode binary data using Base45 as described in draft-faltstrom-base45-06 (https://datatracker.ietf.org/doc/draft-faltstrom-base45/)."
arch=('any')
url="https://pypi.org/project/base45/#files"
license=('BSD')
makedepends=("python" 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2a086154572c5f644e82024004a09f6a391f3ce564067e1bf35919d3aee242ba')

package_python-base45() {
  depends+=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}


