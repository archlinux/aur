# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python2-pynlpl
_pypiname=PyNLPl
pkgver=0.6.13
pkgrel=1
pkgdesc="Python Natural Language Processing Library"
arch=('any')
url="https://github.com/proycon/pynlpl"
license=('GPL')
depends=('python2')
makedepends=('python2' 'python2-setuptools')
conflicts=('python2-pynlpl-git')
provides=('python2-pynlpl')
source=("https://pypi.python.org/packages/source/P/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('d3aad41da49a3cfcabbe99261d688728')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
