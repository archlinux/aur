# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-puremagic
pkgname='python-puremagic'
_name=puremagic
pkgver=1.11
pkgrel=2
pkgdesc="A Python python module that will identify a file based off it’s magic numbers."
arch=('any')
url="https://github.com/cdgriffith/puremagic"
license=(MIT)
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('a5373b0f005003aa501908c7bf024c12ba005c7b16abdc39d593edfd219922cfae0311353509d7093c6a4c5c97a29aed57bfb1400ae04c74997ac40477f3cbc3')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
