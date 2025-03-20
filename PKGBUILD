# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-cognitiveservices-speech
pkgname=python-${_name}
pkgver=1.43.0
pkgrel=1
pkgdesc='Microsoft Cognitive Services Speech SDK for Python'
arch=('x86_64' 'aarch64')
url='https://pypi.org/project/azure-cognitiveservices-speech'
license=('Other/Proprietary ')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}-py3-none-manylinux1_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}-py3-none-manylinux2014_aarch64.whl")
sha256sums_x86_64=('e12527746fc5bff040c66e20172544e9708e10b29d9f3acc365576d44ccb7c5c')
sha256sums_aarch64=('07bdedba8494edfb24306279d3b0500ece016fc811ec0b3366707a75d118a245')
depends=('python>=3.7')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
