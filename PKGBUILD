# Maintainer: Alex Kubica <alexkubicail@gmail.com>
_name=decorating
pkgname=python-decorating
pkgver=0.5.2
pkgrel=1
pkgdesc="A Meta Repo To Decorators"
arch=(any)
url="https://pypi.python.org/pypi/decorating"
license=('MIT')
depends=('python')
source=('https://pypi.python.org/packages/24/55/60da70073bda04992de6f0108f1844ebf07eddd83036161e7bd43cfa3bf3/decorating-0.5.2.tar.gz#md5=fa6580d992de776ff5ee6661ff5fcdbf')
md5sums=('fa6580d992de776ff5ee6661ff5fcdbf')

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
