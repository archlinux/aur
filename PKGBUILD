# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-puremagic
pkgname='python-puremagic'
_name=puremagic
pkgver=1.10
pkgrel=1
pkgdesc="A Python python module that will identify a file based off it’s magic numbers."
arch=('any')
url="https://github.com/cdgriffith/puremagic"
license=(MIT)
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('fcbd9513c290e7a4ae65795fbd9b787f54ad6b1a1e27d16dec999c90614b534c46d121216869490838a91abd3fe4d758561474000ad37f379305ab19bf75d58b')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
