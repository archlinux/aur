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
makedepends=('git' 'python-setuptools')
source=("https://pypi.python.org/packages/cf/05/a33843c06643a492ae593f98cdcaaa5674ec4ad5025e53c0ff2918d60840/dash_html_components-$pkgver.tar.gz")
sha256sums=('SKIP')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check(){
#  cd "$srcdir/$pkgname"
#  python -m unittest
#}
# vim:ts=2:sw=2:et:
