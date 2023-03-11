# Maintainer: robertfoster

pkgname=python-epitran
pkgver=1.24
pkgrel=1
pkgdesc="A library and tool for transliterating orthographic text as IPA (International Phonetic Alphabet)."
arch=('any')
depends=('python' 'python-marisa-trie' 'python-panphon' 'python-regex' 'python-requests')
makedepends=('python-setuptools')
url="https://github.com/dmort27/epitran"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")

package() {
  cd ${pkgname##python-}-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('ca43d62a7c6f4441e409327cdf093a44758d82e8e71a5e6c59884d61621ced6e')
