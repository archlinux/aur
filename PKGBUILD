# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-thinc-bin-8.3.2
pkgver=8.3.2
pkgrel=2
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
source=(https://files.pythonhosted.org/packages/50/8a/4dcf7aae62c208b2decf65c03ab502d096b848f59f7dade00dbdefd952eb/thinc-8.3.2-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl)
md5sums=('abfbfa05d42977ab6b92075498997a52')

package() {
  python -m installer --destdir="$pkgdir" "thinc-8.3.2-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
}
# vim:set ts=2 sw=2 et:
