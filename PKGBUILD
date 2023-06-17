# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-base45
pkgname=('python-base45')
_name=${pkgbase#python-}
pkgver=0.4.4
pkgrel=1
pkgdesc="A Python module to encode/decode binary data using Base45 as described in draft-faltstrom-base45-06 (https://datatracker.ietf.org/doc/draft-faltstrom-base45/)."
arch=('any')
url="https://pypi.org/project/base45/#files"
license=('BSD')
makedepends=("python" 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('352cddb4e717b764477467aae7440373164ce1b93d2c4465da8f878725047fa6')

package_python-base45() {
  depends+=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}


