# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash
_pkgname=dash
pkgver=0.39.0
pkgrel=1
pkgdesc="A python framework for building analytical web applications"
arch=('any')
url="https://plot.ly/products/dash/"
license=('MIT')
depends=('python' 'python-dash-renderer' 'python-dash-core-components' 'python-dash-html-components' 'python-flask' 'python-flask-compress' 'python-flask-seasurf' 'python-plotly' 'python-requests')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7277b469b5e4a3648265b6cf4c24826e71bbc2a995ab1435873152c8e50c2c57')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

## vim:ts=2:sw=2:et:
