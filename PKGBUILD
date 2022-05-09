pkgname=python-difftime-git
pkgver=1.0.0
pkgrel=1
arch=('any')
pkgdesc='Calculate interval time differences'
url='https://github.com/jmdaemon/difftime'
license=('GPL3')
depends=('python')
optdepends=()
makedepends=('python-setuptools' )
source=("$pkgname::git+https://github.com/jmdaemon/difftime#branch=master")
provides=(python-difftime)
conflicts=(python-difftime)
sha512sums=("SKIP")

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root "$pkgdir" --optimize=1
}
