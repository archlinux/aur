# Maintainer: Alex Kubica <alexkubicail@gmail.com>
_name=decorating
pkgname=python-decorating
pkgver=0.5
pkgrel=1
pkgdesc="A Meta Repo To Decorators"
arch=(any)
url="https://pypi.python.org/pypi/decorating"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/bf/2d/5306faa36889f29ca5a7e961c42ee7fb834b6f0bc5629f4952d3019d963f/${_name}-${pkgver}.tar.gz")
md5sums=('2fec8caed3c165acde8f2ec7319429ce')

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
