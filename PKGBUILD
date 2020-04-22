# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python2-pypsdd
_gitname="pypsdd"
pkgver=0.1
pkgrel=1
pkgdesc="The Python Probabilistic Sentential Decision Diagrams (PSDD) Package."
arch=('any')
url="https://github.com/art-ai/pypsdd"
license=('Apache 2.0')
depends=('python2')
optdepends=('pypy')
makedepends=('git')
source=("git+https://github.com/art-ai/pypsdd")
sha256sums=('SKIP')

build() {
  cd "$_gitname"
  python2 setup.py build
}

package() {
  cd "$_gitname"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

