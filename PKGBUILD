# Mantainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=trovotutto
pkgver=0.1
pkgrel=2
pkgdesc='small naive python 3.x search engine using k-grams'
arch=('any')
url="https://github.com/tallero/${pkgname}"
license=('AGPL3')
depends=(
  'python'
  'python-nltk'
  'python-pyxdg'
  'python-setproctitle')
makedepends=('python-setuptools')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('2e93b85675efbeaa289bc9b531ca1f60990bee688a2cf36e9a13bf681691fe53')

package() {
  cd "${pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
