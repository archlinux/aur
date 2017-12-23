# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-nose-progressive'
pkgver=1.5.1
pkgrel=1
pkgdesc="A Python nose plugin with a progress bar and smarter tracebacks"
arch=('x86_64')
url="https://pypi.python.org/pypi/nose-progressive/"
license=('MIT')
depends=('python' 'python-blessings>=1.3' 'python-blessings<2.0')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/4d/0c/c8b64017f43cddcae7e2ed5f3d7dc8b924311094882d9d9daa7339b0ff67/nose-progressive-${pkgver}.tar.gz")
md5sums=('1e2780f4d0e2eff5b63715b5bd799274')

package() {
  cd "${srcdir}/nose-progressive-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
