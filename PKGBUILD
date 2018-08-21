# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=concierge-mako
pkgver=0.2
pkgrel=4
pkgdesc='Mako support for your concierge template files.'
license=('MIT')
url='https://github.com/9seconds/concierge-mako'
depends=('concierge' 'python-mako')
makedepends=('python-setuptools' 'python-pbr')
source=("https://github.com/9seconds/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d73cf122c03b384396337b34791dca9a461899988d14dd0f34d3b4b42b954ee2')
arch=('any')
options=(!emptydirs)

package(){
  cd $srcdir/${pkgname}-$pkgver
  python setup.py install --root=$pkgdir
}
