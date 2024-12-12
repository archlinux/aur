# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-spacy-bin
_pkgname=html2image
pkgver=3.8.3
pkgrel=1
pkgdesc="Industrial-strength Natural Language Processing (NLP) in Python"
arch=('x86_64')
url="https://github.com/explosion/spaCy"
license=('MIT')
provides=(python-spacy)
conflicts=(python-spacy)
depends=(
  'python-catalogue'
  'python-cymem'
  'python-jinja'
  'python-langcodes'
  'python-murmurhash'
  'python-numpy'
  'python-preshed'
  'python-pydantic'
  'python-requests'
  'python-smart_open'
  'python-spacy-loggers'
  'python-srsly'
  'python-thinc'
  'python-tqdm'
  'python-typer'
  'python-wasabi'
  'python-weasel')
source=("https://github.com/explosion/spaCy/releases/download/release-v${pkgver}/spacy-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
md5sums=('5a1107cd6688653cbf74458cd1540a01')

package() {
  python -m installer --destdir="$pkgdir" "spacy-${pkgver}-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
}
# vim:set ts=2 sw=2 et:
