# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-random_word_generator
_pkgname=Random-Word-Generator
pkgver=1.1
pkgrel=1
pkgdesc="Python Library That Generates Random Words At Specified Lengths"
url="https://github.com/GIJack/Random-Word-Generator"
arch=(any)
license=('MIT')
depends=('python')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/Random-Word-Generator/archive/${pkgver}.tar.gz")

sha256sums=('56bb5cb9ffa21bea017069be6fd8645db60da6918b2911020d4af64c58f001ba')

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 Random_Word_Generator.py "${pkgdir}/usr/lib/python3.8/Random_Word_Generator.py"
}
