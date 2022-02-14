# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-puremagic
pkgname='python-puremagic'
_name=puremagic
pkgver=1.12
pkgrel=1
pkgdesc="A Python python module that will identify a file based off it’s magic numbers."
arch=('any')
url="https://github.com/cdgriffith/puremagic"
license=(MIT)
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('0c97064f62976ec4bfc88e118cebac1cf3218cc9069af7823c50ca1920643e7984a60217387daedef44caf04a65abb51db590a662709c8321e463b30857d0189')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
