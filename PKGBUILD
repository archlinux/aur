# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-cognitiveservices-speech
pkgname=python-${_name}
pkgver=1.44.0
pkgrel=1
pkgdesc='Microsoft Cognitive Services Speech SDK for Python'
arch=('x86_64' 'aarch64')
url='https://pypi.org/project/azure-cognitiveservices-speech'
license=('LicenseRef-Microsoft')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}-py3-none-manylinux1_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}-py3-none-manylinux2014_aarch64.whl")
sha256sums_x86_64=('e5f07fc0587067850288c17aebf33d307d2c1ef9e0b2d11d9f44bff2af400568')
sha256sums_aarch64=('3461e22cf04816f69a964d936218d920240f987c0656fdaaf46571529ff0f7e6')
depends=('python' 'python-azure-core')
makedepends=('python-installer')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
