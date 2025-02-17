# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-cognitiveservices-speech
pkgname=python-${_name}
pkgver=1.42.0
pkgrel=1
pkgdesc='Microsoft Cognitive Services Speech SDK for Python'
arch=('x86_64' 'aarch64')
url='https://pypi.org/project/azure-cognitiveservices-speech'
license=('Other/Proprietary ')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}-py3-none-manylinux1_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}-py3-none-manylinux2014_aarch64.whl")
sha256sums_x86_64=('90890a147499239f37b0b1a5112c51820b90fa2b5adafa0df4da6cc0c211887f')
sha256sums_aarch64=('106fbdb165a215cada47d7e95851e0b9d2755a3f2355369bab4915ad001efe89')
depends=('python>=3.7')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
