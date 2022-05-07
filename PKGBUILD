pkgname=python-sapply-git
pkgver=0.1.9
pkgrel=1
arch=('any')
pkgdesc='Apply a series of string manipulations on text easily.'
url='https://github.com/jmdaemon/sapply'
license=('MIT')
depends=('python' 'python-wora' 'python-regex' 'python-spacy')
optdepends=()
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/jmdaemon/sapply#branch=master")
provides=(python-sapply)
conflicts=(python-sapply)
sha512sums=("SKIP")

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root "$pkgdir" --optimize=1
}
