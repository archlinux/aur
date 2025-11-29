# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-abx-spec-searchbackend
pkgver=0.1.0
pkgrel=1
pkgdesc="Add your description here."
arch=('any')
url="https://pypi.org/project/abx-spec-searchbackend"
license=('MIT')
depends=('python' 'python-abx' 'python-abx-spec-config')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://pypi.python.org/packages/source/a/abx-spec-searchbackend/abx_spec_searchbackend-${pkgver}.tar.gz")
md5sums=('08680b0041344299b28ec6247bc56512')

build() {
  cd "$srcdir/abx_spec_searchbackend-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/abx_spec_searchbackend-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
