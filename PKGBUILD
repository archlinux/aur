# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-ordered-set'
pkgver=2.0.2
pkgrel=1
pkgdesc="Python MutableSet that remembers its order, so that every entry has an index"
arch=('any')
url="https://pypi.python.org/pypi/ordered-set"
license=('MIT')
depends=(
  'python'
)
makedepends=('python-setuptools')
optdepends=()
provides=('python-ordered-set')
conflicts=('python-ordered-set')
options=(!emptydirs)
source=("https://pypi.python.org/packages/c3/1c/4ddba479a75369b31655e295463bc37e5f84acb4fa7f34548946ff0160e3/ordered-set-2.0.2.tar.gz")
md5sums=('7b8d73dc64fd3c783ecb48e050bfcc0d')

package() {
  cd "${srcdir}/ordered-set-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
