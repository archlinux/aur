# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash
_pkgname=dash
pkgver=1.6.1
pkgrel=1
pkgdesc="A python framework for building analytical web applications"
arch=('any')
url="https://plot.ly/products/dash/"
license=('MIT')
depends=('python' 'python-dash-renderer' 'python-dash-core-components' 'python-dash-html-components' 'python-flask' 'python-flask-compress' 'python-flask-seasurf' 'python-plotly' 'python-requests')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('84fcc770e7fba4ddc867570b6527249dbcda2e0cc3989ea00b34d97b036d8a98')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

## vim:ts=2:sw=2:et:
