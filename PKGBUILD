# Mantainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=trovotutto
pkgver=0.1
pkgrel=2
pkgdesc='small naive python 3.x search engine using k-grams'
arch=('any')
url='https://github.com/tallero/trovotutto'
license=('AGPL3')
depends=('python' 'python-nltk' 'python-pyxdg' 'python-setproctitle')
makedepends=('python-setuptools')
source=('trovotutto::git+https://github.com/tallero/trovotutto.git#tag=$pkgver')
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
