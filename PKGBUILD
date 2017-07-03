# Maintainer: Daniel Manila <daniel.develop@manilas.net>
pkgname=weresync
pkgver=1.0.2
pkgrel=1
_name=WereSync
pkgdesc='Incrementally clone linux drives'
arch=(any)
url='https://github.com/DonyorM/weresync'
license=('Apache')
groups=('any')
depends=('python' 'python-parse' 'python-yapsy')
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
#WereSync v1.0.2 md5sum
md5sums=('a7620b0f2e6abf0bb89025efb29549b1')

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
