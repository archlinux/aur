# Maintainer: robertfoster

pkgname=python-panphon
pkgver=0.19.1
pkgrel=1
pkgdesc="Python package and data files for manipulating phonological segments (phones, phonemes) in terms of universal phonological features."
arch=('any')
depends=('python' 'python-editdistance' 'python-munkres' 'python-numpy' 'python-pyaml' 'python-regex' 'python-unicodecsv')
makedepends=('python-setuptools')
url="https://github.com/dmort27/panphon"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")

package() {
  cd ${pkgname##python-}-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('9d5a189c8f8ef8cf4b1dfa90c0c0c66543d4257591b37d8b95fc8bfe81a09a0a')
