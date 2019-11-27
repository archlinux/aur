# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-html-components
_pkgname=dash_html_components
pkgver=1.0.2
pkgrel=1
pkgdesc="Dash UI HTML components suite"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8992097a044f5add21f86ccbe0caef8c499394a04d5f2b6cc4458a42f37cca98')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
