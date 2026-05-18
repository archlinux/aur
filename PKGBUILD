# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-cognitiveservices-speech
pkgname=python-$_name
pkgver=1.50.0
pkgrel=1
pkgdesc='Microsoft Cognitive Services Speech SDK for Python.'
arch=('x86_64' 'aarch64')
url='https://pypi.org/project/azure-cognitiveservices-speech'
license=('LicenseRef-Microsoft')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/$_name/${_name//-/_}-$pkgver-py3-none-manylinux1_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/$_name/${_name//-/_}-$pkgver-py3-none-manylinux2014_aarch64.whl")
sha256sums_x86_64=('e58faf51d82963b395c06a7e65dd6bead71c242e013695c62949ff8b9607d77e')
sha256sums_aarch64=('828891baac849137d9773d980910939c0541cbfc4653265597fea592684efafd')
depends=('python' 'python-azure-core')
makedepends=('python-installer')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
