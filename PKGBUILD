# Maintainer: McNoggins <gagnon88 (at) Gmail (dot) com>
pkgname="python-pythonpy"
pkgver=0.4.11
pkgrel=1
pkgdesc="command line kung fu with python (python -c, with tab completion and shorthand)"
arch=('any')
url="https://github.com/Russell91/pythonpy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('bash-completion: shell completion support')
provides=('python-pythonpy')
conflicts=('python2-pythonpy')
source=("https://pypi.python.org/packages/source/p/pythonpy/pythonpy-$pkgver.tar.gz")
sha256sums=('2a8eeace21bb6d1cff3822f612fc5c33cbaaad0933dce84955e594a0bf1ec81a')

prepare() {

cd "$srcdir/pythonpy-$pkgver"

}

package() {
  cd "$srcdir/pythonpy-$pkgver"
  
  # Setup package
  python setup.py install --root="$pkgdir"
}
