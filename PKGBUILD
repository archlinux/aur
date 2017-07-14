# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=dash-html-components
_pkgname=dash_html_components
pkgver=0.6.2
pkgrel=1
pkgdesc="HTML components for dash."
arch=('any')
url="https://plot.ly/dash/dash-html-components"
license=('MIT')
depends=('python')
optdepends=()
checkdepends=('python-dash')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('9c8be2773d878cd4bdeb71a4918c77578bb19aff6198447eb1aa9640e855be73')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$pkgname"
#  python -m unittest
#}
# vim:ts=2:sw=2:et:
