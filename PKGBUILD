# Maintainer: robertfoster

pkgname=python-epitran
pkgver=1.35.2 # renovate: datasource=github-tags depName=dmort27/epitran
pkgrel=1
pkgdesc="A library and tool for transliterating orthographic text as IPA (International Phonetic Alphabet)."
arch=('any')
depends=('python' 'python-marisa-trie' 'python-panphon' 'python-regex' 'python-requests')
makedepends=('python-setuptools')
url="https://github.com/dmort27/epitran"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")

package() {
  cd ${pkgname##python-}-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('3e73dca5627975a2c8d23206c4dce28af4e1a31d63e55c59ec6e7ed3759e9d35')
