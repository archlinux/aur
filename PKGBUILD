# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

pkgname=python2-multipledispatch
_name=${pkgname#python2-}
pkgver=0.5.0
pkgrel=1
pkgdesc="A relatively sane approach to multiple dispatch in Python."
arch=('any')
url="https://pypi.python.org/pypi/multipledispatch"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9e92d63efad2c9b68562175d9148d8cb32d04bf5557991190e643749bf4ed954')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
