# Maintainer: robertfoster

pkgname=python-epitran
pkgver=1.35.1 # renovate: datasource=github-tags depName=dmort27/epitran
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

sha256sums=('3bd520c43158a2269e42042f409be455c545a0154a1bd06d6afda517bc7cf901')
