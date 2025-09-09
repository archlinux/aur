# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-thinc-bin-8.3.2
pkgver=8.3.6
pkgrel=1
pkgdesc="Industrial-strength Natural Language Processing (NLP) in Python"
arch=('x86_64')
url='https://github.com/explosion/thinc'
license=('MIT')
provides=(python-thinc=$pkgver)
conflicts=(python-thinc)
depends=(
  'python-blis'
  'python-catalogue'
  'python-confection'
  'python-cymem'
  'python-murmurhash'
  'python-numpy'
  'python-packaging'
  'python-preshed'
  'python-pydantic'
  'python-srsly'
  'python-wasabi')
source=(https://files.pythonhosted.org/packages/e5/42/c87990ca214b9910f33b110d3b1ac213407388d35376bc955ad45e5de764/thinc-8.3.6-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl)
md5sums=('ed08301d57ad5d5aa455b64b60421025')

package() {
  python -m installer --destdir="$pkgdir" "thinc-8.3.6-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
}
# vim:set ts=2 sw=2 et:
