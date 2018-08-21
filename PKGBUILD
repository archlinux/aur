# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=concierge-jinja
pkgver=0.2
pkgrel=4
pkgdesc='Jinja2 support for your concierge template files.'
license=('MIT')
url='https://github.com/9seconds/concierge-jinja'
depends=('concierge' 'python-jinja')
makedepends=('python-setuptools' 'python-pbr')
source=("https://github.com/9seconds/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7916318aa529705fca71bc771d382aebbc54d8b2b96a3e944d212c287c9a1516')
arch=('any')
options=(!emptydirs)

package(){
  cd $srcdir/${pkgname}-$pkgver
  python setup.py install --root=$pkgdir
}
