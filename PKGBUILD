# Mantainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname="trovotutto"
pkgname="${_pkgname}-git"
pkgver=0.1
pkgrel=2
pkgdesc='small naive python 3.x search engine using k-grams'
arch=('any')
url="https://github.com/tallero/${_pkgname}"
license=('AGPL3')
depends=(
  'python'
  'python-nltk'
  'python-pyxdg'
  'python-setproctitle')
makedepends=(
  'git'
  'python-setuptools')
source=(
  "${_pkgname}::git+${url}"
)
sha256sums=('SKIP')

package() {
  cd "${_pkgname}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
