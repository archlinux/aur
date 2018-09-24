# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dash-html-components
_pkgname=dash_html_components
pkgver=0.13.2
pkgrel=1
pkgdesc="Dash UI HTML components suite"
arch=('any')
url="https://plot.ly/products/dash"
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('daf80a0b9dd244bb34e47381a9766617451301ac5aa204faa7e7f069a52d93f9')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
