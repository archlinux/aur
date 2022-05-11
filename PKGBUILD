# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-puremagic
pkgname='python-puremagic'
_name=puremagic
pkgver=1.13
pkgrel=1
pkgdesc="A Python python module that will identify a file based off it’s magic numbers."
arch=('any')
url="https://github.com/cdgriffith/puremagic"
license=(MIT)
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('be2a979e07b08bdc868c8def2a864aaa8725a72a719e153bfb1217ced8628c717d75c0ee189882a99e7159772404143d1cdb91f4e12af8b3f280c523a62253e9')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
