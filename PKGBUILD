# Maintainer: Alex Kubica <alexkubicail@gmail.com>
_name=asciinema
pkgname="python-${_name}"
pkgver=1.3.0
pkgrel=1
pkgdesc="Record and share your terminal sessions, the right way."
arch=(any)
url="https://asciinema.org/"
license=('MIT')
depends=('python')
conflicts=('asciinema' 'asciinema-git')
source=("https://pypi.python.org/packages/06/96/93947d9be78aebb7985014fdf4d84896dd0f62514d922ee03f5bb55a21fb/${_name}-${pkgver}.tar.gz")
md5sums=('cd7bc7afec49fc0322fc779fe00e2a99')

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
