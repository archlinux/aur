# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-puremagic
pkgname='python-puremagic'
_name=puremagic
pkgver=1.14
pkgrel=1
pkgdesc="A Python python module that will identify a file based off it’s magic numbers."
arch=('any')
url="https://github.com/cdgriffith/puremagic"
license=(MIT)
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('6ea721a5b8997586bdd90f265a34a37178bee4321aa512524b04d9be528b5c1b1c57c93383b448af5b84ce9dc6eaf9cb83e1c81cae9bb323a3a75e709fd9bf27')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
