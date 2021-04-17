# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-html-components
_pkgname=dash_html_components
pkgver=1.1.3
pkgrel=1
pkgdesc="Dash UI HTML components suite"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=()
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('88adb77a674d5d7d0835d71c469f6e7b4aa692f9673808a474d244b71863c58a')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
