# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-html-components
_pkgname=dash_html_components
pkgver=1.1.2
pkgrel=1
pkgdesc="Dash UI HTML components suite"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=()
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('83eaa39667b7c3e6cbefa360743e6e536d913269ea15db14308ad022c78bc301')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
