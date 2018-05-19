# Maintainer: Hao Cheng <ch1994@outlook.com>

pkgname='python-sklearn-bayes'
_pkgname='sklearn-bayes'
pkgdesc='Python package for Bayesian Machine Learning with scikit-learn API'
pkgver='1'
pkgrel='1'
epoch=
arch=('i686' 'x86_64')
url='https://github.com/AmazaspShumik/sklearn-bayes'
license=('unknown')
groups=()
depends=('python-numpy' 'python-scipy' 'python-scikit-learn')
makedepends=('git' 'cython')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=(git://github.com/AmazaspShumik/sklearn-bayes.git)
noextract=()
sha512sums=('SKIP')
PKGEXT='.pkg.tar.gz'

build(){
    cd "$srcdir/$_pkgname"
    python setup.py build
}
package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root=${pkgdir} --optimize=1
}
